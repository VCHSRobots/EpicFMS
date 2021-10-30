# game_manager.py -- manages the running of the game, including game configuration
# dlb, Oct 2021

import target_manager
import score_sender
import json
import base64
from fmslogger import log
import utils
import time

game_config = {
    "teamnames" : {"blue": "Scrikien", "red": "Cncters"},
    "runscoreboardtest" : False,
    "unitassignments" : {"mover-1" : "red", "mover-2" : "blue",
                          "slider-1" : "red", "slider-2" : "red",
                          "slider-3" : "blue", "slider-4" : "blue",
                          "slider-5" : "none", "slider-6" : "none", 
                          "basket-1" : "none", "basket-2" : "none" } }

game_periods = {"countdown": 5, "auto" : 0, "teleop" : 140, "endgame" : 10}

time0 = 0   # Time at start of countdone, or again at start of game
total_game_secs = 0
game_mode = "standby"
blue_win = False 
red_win = False
status_msg = "Even Later."
blue_mover_hits = 0
red_mover_hits = 0
blue_slider_hits = 0
red_slider_hits = 0
blue_score = blue_slider_hits + 10*blue_mover_hits 
red_score = red_slider_hits + 10*red_mover_hits
ss_obj = None


def update_game():
    global game_mode, time0
    # Should be called often to keep the game running
    if game_mode == "standby": return 
    if game_mode == "countdown": 
        telp = time.monotonic() - time0 
        if telp >= 5.0:
            game_mode = "teleop"
            target_manager.open_slider_units() 
            target_manager.set_start_counts()
            target_manager.broadcast_status(game_mode)
            time0 = time.monotonic()
        return
    if game_mode == "teleop":
        count_hits()
        telp = time.monotonic() - time0 
        if telp > total_game_secs - game_periods["endgame"]:
            game_mode = "matchfinal"
            target_manager.broadcast_status(game_mode)
            return
    if game_mode == "matchfinal":
        count_hits()
        telp = time.monotonic() - time0
        if telp > total_game_secs:
            game_mode = "postresult"
            target_manager.close_slider_units()
            target_manager.broadcast_status(game_mode)
            return

def start():
    log("STARTING THE GAME.")
    global total_game_secs, game_mode, time0
    total_game_secs = game_periods["auto"] + game_periods["teleop"] + game_periods["endgame"]
    game_mode = "countdown"
    target_manager.close_slider_units()
    time0 = time.monotonic()
    target_manager.broadcast_status(game_mode)

def reset():
    log("Resetting the game.")
    global blue_mover_hits, red_mover_hits, blue_slider_hits, red_mover_hits
    global blue_score, red_score, game_mode, total_game_secs
    blue_mover_hits = 0
    red_mover_hits = 0
    blue_slider_hits = 0
    red_mover_hits = 0
    blue_score = 0
    red_score = 0
    game_mode = "standby"
    ss_obj.clear()
    target_manager.broadcast_status(game_mode)
    
def abort():
    log("Aborgint the game.")
    global game_mode
    game_mode = "standby"
    target_manager.broadcast_status(game_mode)
    return

def count_hits():
    global blue_mover_hits, red_mover_hits, blue_slider_hits, red_slider_hits
    global blue_score, red_score
    bmh, rmh, bsh, rsh = 0, 0, 0, 0
    ua = game_config["unitassignments"]
    for uname in ua.keys():
        unittype, snum = uname.split("-")
        num = int(snum) - 1 
        if unittype == "mover":
            n = target_manager.get_hits(unittype+"s", num)
            if ua[uname] == "red": rmh += n
            if ua[uname] == "blue": bmh += n 
        if unittype == "slider":
            n = target_manager.get_hits(unittype+"s", num)
            if ua[uname] == "red": rsh += n
            if ua[uname] == "blue": bsh += n   
    blue_score = bmh * 10 + bsh
    red_score = rmh * 10 + rsh 
    blue_mover_hits = bmh 
    blue_slider_hits = bsh
    red_mover_hits = rmh 
    red_slider_hits = rsh 
    return
  
def get_game_config():
    return game_config

def get_score():
    # Returns blue-red score
    return (blue_score, red_score)

def get_time():
    global game_mode
    # Returns countdown time, as string
    if game_mode == "standby": return "0:00"
    t_elp = time.monotonic() - time0
    if game_mode == "countdown":
        t_elp = time.monotonic() - time0
        if t_elp > 5.0: return "0"
        return "%d" % int(5.0 - t_elp)
    if game_mode == "teleop" or game_mode == "auto" or game_mode == "matchfinal":
        secs_to_go = int(total_game_secs - t_elp)
        if secs_to_go <= 0: return "0:00"
        mins_to_go = int(secs_to_go / 60)
        secs = secs_to_go - 60*mins_to_go
        return "%d:%02d" % (mins_to_go, secs)
    return "0:00"


def get_time_label():
    if game_mode == "countdown": return "Count Down"
    if game_mode == "matchfinal": return "End Game"
    if game_mode == "auto": return "Auto"
    if game_mode == "teleop": return "TeleOp"
    return ""

def get_gamemode():
    if game_mode == "standby": return "StandBy"
    if game_mode == "countdown": 
        t_elp = time.monotonic() - time0
        if t_elp > 3.0: return "GET SET"
        if t_elp > 1.0: return "ON YOUR MARK"
        return "Countdown"
    if game_mode == "teleop" or game_mode == "auto" or game_mode == "matchfinal":
        return "GAME ON"
    if game_mode == "postresult": return "Post Match"
    return "---"

def get_runscoreboardtest():
    # Returns True if running scoreboard test
    return game_config["runscoreboardtest"]

def get_teamnames():
    #returns blue-red names
    tn = game_config["teamnames"]
    return (tn["blue"], tn["red"])

def reassign_unit(k, v):
    if k in game_config["unitassignements"].keys():
        if v.lower() in ("blue", "red", "none"):
            game_config["unitassignements"][k] = v.lower()

def process_game_command(request):
    global red_win, blue_win
    log("Processing Game Command")
    winner = request.args.get("winner", "dummy")
    if winner != "dummy":
        if winner == "rb" or winner == "br": 
            red_win = True 
            blue_win = True
            log("Both Teams set to win.")
        if winner == "r": 
            red_win = True
            blue_win = False
            log("Red Team set to win.")
        if winner == "b":
            red_win = False
            blue_win = True
            log("Blue Team set to win.")
        if winner == "0":
            red_win = False
            blue_win = False
            log("Win banner turned off.")
        return
    btn = request.args.get("button", "dummy")
    if btn != "dummy":
        if btn == "start": 
            start()
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
    if "teamnames" in new_config.keys():
        tn = new_config["teamnames"]
        if "blue" in tn.keys(): game_config["teamnames"]["blue"] = tn["blue"]
        if "red" in tn.keys(): game_config["teamnames"]["red"] = tn["red"]
    if "runscoreboardtest" in new_config.keys():
        tf = utils.make_bool(new_config["runscoreboardtest"])
        log("Changing runscoreboardtest to %s" % tf)
        game_config["runscoreboardtest"] = tf
    if "unitassignments" in new_config.keys():
        for k in new_config["unitassignments"].keys():
            if k in game_config["unitassignments"].keys():
                v = new_config["unitassignments"][k]
                if v.lower() in ("blue", "red", "none"):
                    game_config["unitassignments"][k] = v.lower()
    log("Game config change processed.")

def get_processed_status(t, i):
    ii = i - 1 
    if target_manager.target_okay(t, ii): return "okay"
    return "bad"

def get_raw_status(pwokay): 
    global blue_score, red_score
    status = {"LoggedIn" : pwokay, "redhits" : red_score, "bluehits" : blue_score}
    status["gamemode"] = get_gamemode()
    status["clock"] = get_time()
    status["mover1"] = get_processed_status("movers", 1)
    status["mover2"] = get_processed_status("movers", 2)
    status["slider1"] = get_processed_status("sliders", 1)
    status["slider2"] = get_processed_status("sliders", 2)
    status["slider3"] = get_processed_status("sliders", 3)
    status["slider4"] = get_processed_status("sliders", 4)
    status["slider5"] = get_processed_status("sliders", 5)
    status["slider6"] = get_processed_status("sliders", 6)
    status["basket1"] = get_processed_status("movers", 1)
    status["basket2"] = get_processed_status("movers", 2)
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

def mover_okay(side):
    ua = game_config["unitassignments"]
    units = ["mover-1", "mover-2"]
    for u in units:
        if ua[u] == side:
            num = int(u[6]) - 1
            if not target_manager.target_okay("movers", num): return False
    return True

def basket_okay(side):
    ua = game_config["unitassignments"]
    units = ["basket-1", "basket-2"]
    for u in units:
        if ua[u] == side:
            num = int(u[7]) - 1
            if not target_manager.target_okay("basketss", num): return False
    return True

def get_grid(side, unit, period):
    if period != "teleop": return "0x0"
    if unit == "sliders": 
        if side == "red":
            return "%dx1" % red_slider_hits
        if side == "blue":
            return "%dx1" % blue_slider_hits
        return "?x?"
    if unit == "mover":
        if side == "red":
            return "%dx10" % red_mover_hits
        if side == "blue":
            return "%dx10" % blue_mover_hits
    return "0x0"

def get_grid_total(side, unit):
    if side == "red":
        if unit == "sliders":
            return "%d" % red_slider_hits 
        if unit == "mover":
            n = 10 * red_mover_hits
            return "%d" % n
        return "0"
    if side == "blue":
        if unit == "sliders":
            return "%d" % blue_slider_hits 
        if unit == "mover":
            n = 10 * blue_mover_hits
            return "%d" % n
        return "0"
    return "0"       



