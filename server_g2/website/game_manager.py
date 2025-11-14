# game_manager.py -- manages the running of the game, including game configuration
# dlb, Oct 2021
# Updated for SideQuest, Nov 2025

import target_manager
import door_manager
import score_table
import json
import base64
from fmslogger import log
import utils
import time

game_config = {
    "gamename" : "EPIC SIDEQUEST",
    "runscoreboardtest" : False }

game_mode = "standby"
time0 = 0   # Time at start of mode change
total_game_secs = 60
mainscore = score_table.ScoreTable()  # This is where the score is maintained.
door_man = door_manager.DoorManager()
status_msg = ""
ischedule = 1   # The door schedule to use
last_door_state = [False, False, False, False, False, False]

def clear_doors():
    for i in range(6): last_door_state[i] = False

def manage_doors(t):
    global last_door_state
    door_man.set_schedule_num(ischedule)
    new_doors = door_man.get_doors(t)
    change = False
    for i in range(6):
        if new_doors[i] != last_door_state[i]:
            change = True
            if new_doors[i]: target_manager.open_slider(i)
            else:            target_manager.close_slider(i)
    if change: last_door_state = new_doors

def update_game():
    global game_mode, time0, status_msg
    # Should be called often to keep the game running
    update_score()
    if game_mode == "standby": 
        return 
    if game_mode == "countdown": 
        telp = time.monotonic() - time0 
        if telp >= 5.0:
            if mainscore.get_hits() > 0:
                status_msg = "Problem with RESET. Game is ABORTED."
                game_mode = "standby"
                return
            game_mode = "play"
            manage_doors(0.0) 
            target_manager.broadcast_status(game_mode)
            time0 = time.monotonic()
            mainscore.set_enable(True)
            log("Starting The Game")
        return
    if game_mode == "play":
        telp = time.monotonic() - time0
        manage_doors(telp)
        if telp >= total_game_secs:
            game_mode = "postwait"
            target_manager.broadcast_status(game_mode)
            target_manager.close_slider_units()
            clear_doors()
            log("Finished the Game.")
            time0 = time.monotonic()
        return
    if game_mode == "postwait":
        telp = time.monotonic() - time0
        if telp >= 5.0:
            update_score()   # Final Count
            mainscore.set_enable(False)
            game_mode = "playfinished"
            target_manager.broadcast_status(game_mode)
            time0 = time.monotonic()
        return
    if game_mode == "playfinished":
        return

def start(isch):
    global ischedule
    global game_mode, time0, status_msg
    log("STARTING the game.")
    status_msg = ""
    if isch < 0 or isch > 3: 
        ischedule = 1
        log("Game started with invalid schedule. Schedule ONE used.")
    else:
        ischedule = isch
        log("Schedule %d used. " % ischedule)
    mainscore.clear()
    game_mode = "countdown"
    target_manager.set_start_counts()
    target_manager.close_slider_units()
    target_manager.broadcast_status(game_mode)
    clear_doors()
    time0 = time.monotonic()

def reset():
    log("RESETTING the game.")
    global game_mode, status_msg
    mainscore.clear()
    status_msg = ""
    game_mode = "standby"
    target_manager.set_start_counts()  # This should reset the hits
    target_manager.close_slider_units()
    clear_doors()
    target_manager.broadcast_status(game_mode)
    time0 = time.monotonic()
    
def abort():
    log("ABORTING the game.")
    global game_mode, status_msg
    status_msg = ""
    game_mode = "standby"
    mainscore.clear()
    target_manager.broadcast_status(game_mode)
    target_manager.close_slider_units()
    clear_doors()
    return

def update_score():
    # First, calculate the current score
    h1 = target_manager.get_hits("sliders", 0)
    h2 = target_manager.get_hits("sliders", 1)
    h3 = target_manager.get_hits("sliders", 2)
    h4 = target_manager.get_hits("sliders", 3)
    h5 = target_manager.get_hits("sliders", 4)
    h6 = target_manager.get_hits("sliders", 5)
    mainscore.set_hits(h1, h2, h3, h4, h5, h6)

    # At this point, the score_sender will call into
    # the game_manager to get the lastest score.

def get_game_config():
    return game_config

def get_totalscore():
    # Returns the total score
    return mainscore.get_total_score()

def get_hits():
    # Returns the individule hits for the six targets
    return mainscore.get_hit_table()

def get_links():
    # Returns the array of link values
    return mainscore.get_link_table()

def get_totalhits():
    # Returns the total hits 
    return mainscore.get_hits()

def get_totallinks():
    # Returns the total link count
    return mainscore.get_links()

def get_doors():
    # Returns a list, each element is one character status for each target
    table = []
    for i in range(6):
        if target_manager.target_okay("sliders", i):
            if target_manager.is_slider_door_open(i): c = "O"
            else: c = " "
        else:
            c = "X"
        table.append(c)
    return table
        
def get_time():
    global game_mode
    # Returns countdown time, as string
    if game_mode == "standby": return "0:00"
    t_elp = time.monotonic() - time0
    if game_mode == "countdown":
        t_elp = time.monotonic() - time0
        if t_elp > 5.0: return "0"
        return "%d" % int(5.0 - t_elp)
    if game_mode == "play":
        secs_to_go = int(total_game_secs - t_elp)
        if secs_to_go <= 0: return "0:00"
        mins_to_go = int(secs_to_go / 60)
        secs = secs_to_go - 60*mins_to_go
        return "%d:%02d" % (mins_to_go, secs)
    return "0:00"

def get_time_label():
    if game_mode == "countdown": return "Count Down"
    if game_mode == "postwait": return "Holding"
    return ""

def get_gamemode():
    if game_mode == "standby": return "StandBy"
    if game_mode == "countdown": 
        t_elp = time.monotonic() - time0
        if t_elp > 3.0: return "GET SET"
        if t_elp > 1.0: return "ON YOUR MARK"
        return "Countdown"
    if game_mode == "play":
        return "GAME ON"
    if game_mode == "postwait" : return "Counting"
    if game_mode == "playfinished": return "Final Score"
    return "---"

def process_game_command(request):
    global red_win, blue_win

    log("Processing Game Command")
    btn = request.args.get("button", "dummy")
    if btn != "dummy":
        if btn == "start": 
            sched = request.args.get("schedule", "dummy")
            if sched != "dummy":
                try: isched = int(sched)
                except: isched = 0
            else: isched = 0 
            start(isched)
            return 
        if btn == "reset":
            reset()
            return 
        if btn == "abort":
            abort()
            return
        log("Unknown button (%s) sent. Not processed." % btn)
        return
    log("Unknown game command: %s" % request.url)
    
def process_gameconfig_update(config):
    #Expects a json map encoded in base64
    log("Setting Game Config.  Recevied Base64.")
    bconfig = config.encode('ascii')  # Produce a byte array of the ascii input
    bbconfig = base64.b64decode(bconfig) # Get a byte sequeence if ascii chars
    sconfig = bbconfig.decode('ascii') # Convert the bytes into a string.
    log("Recived this for game config: " + sconfig)
    try:
        new_config = json.loads(sconfig)
    except BaseException as err:
        log("Unable to decode config input. Error: {0}".format(err))
        return False
    print(new_config)
    for k in new_config.keys():
        v = new_config[k]
        log("%s = %s" % (k, v))
    if "gamename" in new_config.keys():
        game_config["gamename"] = new_config["gamename"]
    if "runscoreboardtest" in new_config.keys():
        tf = utils.make_bool(new_config["runscoreboardtest"])
        log("Changing runscoreboardtest to %s" % tf)
        game_config["runscoreboardtest"] = tf
    log("Game config change processed.")

def get_raw_status(pwokay): 
    status = {"LoggedIn" : pwokay }
    status["gamemode"] = get_gamemode()
    status["clock"] = get_time()
    status["mainscore"] = mainscore.get_total_score()
    status["sliders"] = []
    for i in range(6):
        status["sliders"].append(target_manager.get_slider_status(i))
    status["gamestatusmsg"] = status_msg
    return status

def slider_okay(side):
    ua = game_config["unitassignments"]
    units = ["slider-1", "slider-2", "slider-3", "slider-4", "slider-5", "slider-6"]
    for u in units:   
        if ua[u] == side:
            num = int(u[7]) - 1
            if not target_manager.target_okay("sliders", num): return False
    return True

def get_game_name():
    return game_config["gamename"]

