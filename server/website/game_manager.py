# game_manager.py -- manages the running of the game, including game configuration
# dlb, Oct 2021

import target_manager
import score_sender
import json
import base64
from fmslogger import log
import utils

game_config = {
    "teamnames" : {"blue": "Scrikien", "red": "Cncters"},
    "runscoreboardtest" : False,
    "unitassignments" : {"mover-1" : "red", "mover-2" : "blue",
                          "sider-1" : "red", "slider-2" : "blue",
                          "sider-3" : "none", "slider-4" : "none",
                          "sider-5" : "none", "slider-6" : "none", 
                          "basket-1" : "none", "basket-2" : "none" } }

blue_win = False 
red_win = False



def start():
    pass

def reset():
    pass

def abort():
    pass

def get_game_config():
    return game_config

def get_score():
    # Returns blue-red score
    return (100, 45)

def get_time():
    # Returns countdown time, as int
    return 23

def get_time_label():
    return "Waiting"

def get_gamemode():
    return "standby"

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
            self.start()
            return 
        if btn == "reset":
            self.reset()
            return 
        if btn == "abort":
            self.abort()
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

def get_raw_status(pwokay): 
    nredhits, nbluehits = target_manager.get_hits()
    status = {"LoggedIn" : pwokay, "redhits" : nredhits, "bluehits" : nbluehits}
    status["mover1"] = "okay"
    status["mover2"] = "bad"
    status["slider1"] = "okay"
    status["slider2"] = "bad"
    status["gamestatusmsg"] = "its getting late"
    return status
