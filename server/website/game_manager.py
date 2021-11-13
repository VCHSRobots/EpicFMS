# game_manager.py -- manages the running of the game, including game configuration
# dlb, Oct 2021

import target_manager
import score_sender
import score_table
import json
import base64
from fmslogger import log
import utils
import time

game_config = {
    "teamnames" : {"blue": "SHIRA-KEN", "red": "CNCnts"},
    "runscoreboardtest" : False,
    "unitassignments" : {"mover-1" : "red", "mover-2" : "blue",
                          "slider-1" : "red", "slider-2" : "red",
                          "slider-3" : "blue", "slider-4" : "blue",
                          "slider-5" : "red", "slider-6" : "blue", 
                          "basket-1" : "red", "basket-2" : "blue" } }

game_periods = {"countdown": 5, "auto" : 30, "teleop" : 140, "endgame" : 10, "post" : 5}
game_mode = "standby"
time0 = 0   # Time at start of countdone, or again at start of game
total_game_secs = 0
red_score = score_table.ScoreTable()
blue_score = score_table.ScoreTable()
blue_win = False 
red_win = False
status_msg = ""
baskets_off = True

def update_game():
    global game_mode, time0, baskets_off
    # Should be called often to keep the game running
    if game_mode == "standby": 
        baskets_off = True
        return 
    if game_mode == "countdown": 
        telp = time.monotonic() - time0 
        if telp >= 3.0:
            if baskets_off:
                target_manager.turn_motors_on()
                baskets_off = False
        if telp >= 5.0:
            game_mode = "auto"
            target_manager.open_slider_units() 
            target_manager.set_start_counts()
            target_manager.broadcast_status(game_mode)
            time0 = time.monotonic()
            log("Starting Auto")
        return
    if game_mode == "auto":
        count_hits()
        telp = time.monotonic() - time0
        if telp >= total_game_secs - game_periods["teleop"] - game_periods["endgame"]:
            game_mode = "teleop"
            target_manager.broadcast_status(game_mode)
            log("Starting Teleop")
        return
    if game_mode == "teleop":
        count_hits()
        telp = time.monotonic() - time0 
        if telp > total_game_secs - game_periods["endgame"]:
            game_mode = "matchfinal"
            target_manager.broadcast_status(game_mode)
            log("Starting MatchFinal")
        return
    if game_mode == "matchfinal":
        count_hits()
        telp = time.monotonic() - time0
        if telp > total_game_secs:
            game_mode = "postwait"
            target_manager.close_slider_units()
            target_manager.broadcast_status(game_mode)
            time0 = time.monotonic()
            log("Starting Post Wait")
        return
    if game_mode == "postwait":
        count_hits() 
        telp = time.monotonic() - time0 
        if telp > game_periods["post"]:
            target_manager.turn_motors_off()
            baskets_off = True
            game_mode = "postresult"
            target_manager.broadcast_status(game_mode)
            log("Starting Post Result")
        return

def start():
    log("STARTING the game.")
    global total_game_secs, game_mode, time0
    total_game_secs = game_periods["auto"] + game_periods["teleop"] + game_periods["endgame"]
    game_mode = "countdown"
    target_manager.close_slider_units()
    time0 = time.monotonic()
    target_manager.broadcast_status(game_mode)

def reset():
    log("RESETTING the game.")
    global game_mode
    blue_score.clear()
    red_score.clear()
    game_mode = "standby"
    target_manager.broadcast_status(game_mode)
    target_manager.turn_motors_off()
    target_manager.close_slider_units()
    
def abort():
    log("ABORTING the game.")
    global game_mode
    game_mode = "standby"
    target_manager.broadcast_status(game_mode)
    target_manager.turn_motors_off()
    target_manager.close_slider_units()
    return

def count_hits():
    for side in ("red", "blue"):
        ua = game_config["unitassignments"]
        basket, mover = 0, 0
        slider = [0, 0, 0]
        islider = 0
        for uname in ua.keys():
            unittype, snum = uname.split("-")
            num = int(snum) - 1 
            if unittype == "mover":
                n = target_manager.get_hits(unittype+"s", num)
                if ua[uname] == side: mover += n
            if unittype == "slider":
                n = target_manager.get_hits(unittype+"s", num)
                if ua[uname] == side:
                    if islider < 3: slider[islider] = n 
                    islider += 1 
            if unittype == "basket":
                n = target_manager.get_hits(unittype+"s", num)
                if ua[uname] == side: basket += n
        if side == "red":
            if game_mode == "auto":
                red_score.set_auto(basket, slider[0], slider[1], slider[2], mover)
            if game_mode == "teleop":
                red_score.set_teleop(basket, slider[0], slider[1], slider[2], mover)
            if game_mode == "endgame":
                red_score.set_endgame(basket, slider[0], slider[1], slider[2], mover)
            if game_mode == "post":
                red_score.set_postgame(basket)
        if side == "blue":
            if game_mode == "auto":
                blue_score.set_auto(basket, slider[0], slider[1], slider[2], mover)
            if game_mode == "teleop":
                blue_score.set_teleop(basket, slider[0], slider[1], slider[2], mover)
            if game_mode == "endgame":
                blue_score.set_endgame(basket, slider[0], slider[1], slider[2], mover)
            if game_mode == "post":
                blue_score.set_postgame(basket)
  
def get_game_config():
    return game_config

def get_score():
    # Returns blue-red score
    return (blue_score.get_score(), red_score.get_score())

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
    if game_mode == "postwait" : return "Final Count"
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
    auto = request.args.get("auto", "dummy")
    if auto != "dummy":
      side = request.args.get("side", "dummy")
      if side != "red" and side != "blue":
        log("Bad side parameter (%s) for auto game command." % side)
        return
      cond = request.args.get("outcome", "dummy")
      if cond == "pass":
        if side == "red": red_score.set_autorun(True)
        if side == "blue": blue_score.set_autorun(True)
        log("Auto Score set: %s is set to %s." % (side, cond))
        return
      if cond == "fail":
        if side == "red": red_score.set_autorun(False)
        if side == "blue": blue_score.set_autorun(False)
        log("Auto Score set: %s is set to %s." % (side, cond))
        return
      if cond == "clear":
        if side == "red": red_score.reset_autorun()
        if side == "blue": blue_score.reset_autorun()
        log("Auto Score set: %s is set to %s." % (side, cond))
        return       
      log("Bad outcome parameter (%s) for auto game command." % cond)
      return
    vals = request.args.get("refvalues", "dummy")
    if vals != "dummy":
        vlist = vals.split("x")
        if len(vlist) != 4:
            log("Bad refvalues. Not four numbers separated by x.")
            return
        blueadj = utils.make_int(vlist[0])
        bluerake = utils.make_int(vlist[1])
        redadj = utils.make_int(vlist[2])
        redrake = utils.make_int(vlist[3])
        blue_score.set_adj(blueadj)
        blue_score.set_rake(bluerake)
        red_score.set_adj(redadj)
        red_score.set_rake(redrake)
        log("Referree values set (%s)." % vals)
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
    status = {"LoggedIn" : pwokay, "redhits" : red_score.get_score(), "bluehits" : blue_score.get_score()}
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
    status["basket1"] = get_processed_status("baskets", 1)
    status["basket2"] = get_processed_status("baskets", 2)
    status["blue_adj"] = blue_score.get_adj()
    status["blue_rake"] = blue_score.get_rake()
    status["red_adj"] = red_score.get_adj()
    status["red_rake"] = red_score.get_rake()
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
            if not target_manager.target_okay("baskets", num): return False
    return True

def get_grid(side, unit, period):
    if side == "blue":
        return blue_score.get_grid_item(unit, period)
    if side == "red":
        return red_score.get_grid_item(unit, period)
    return "0x0"

def get_grid_total(side, unit):
    if side == "blue":
        return blue_score.get_grid_total(unit)
    if side == "red":
        return red_score.get_grid_total(unit)
    return "0"

def get_auto_score(side):
  # returns okay, fail, show, score
  if game_mode == "standby": return False, False, False, 0
  if side == "red":
    show, pass_cb, fail_cb, score = red_score.get_auto_score()
    return pass_cb, fail_cb, show, score  
  if side == "blue":
    show, pass_cb, fail_cb, score = blue_score.get_auto_score()
    return pass_cb, fail_cb, show, score  
  return False, False, False, 0

def get_target_checkmarks(side):
    if side == "red":
        b = red_score.get_basket_checkmark()
        m = red_score.get_mover_checkmark()
        s1, s2, s3 = red_score.get_slider_checkmarks()
        return b, m, s1, s2, s3
    if side == "blue":
        b = blue_score.get_basket_checkmark()
        m = blue_score.get_mover_checkmark()
        s1, s2, s3 = blue_score.get_slider_checkmarks()
        return b, m, s1, s2, s3
    return False, False, False, False, False   

def get_raking(side):
    if side == "red": return red_score.get_rake() 
    if side == "blue": return blue_score.get_rake() 
    return 0

def get_adjustment(side):
    if side == "red": return red_score.get_adj()
    if side == "blue": return blue_score.get_adj() 
    return 0  


