# game_manager.py -- manages the running of the game, inccluding game configuration
# dlb, Oct 2021

import json
import copy
import base64

from werkzeug.wrappers import PlainRequest
from fmslogger import log
import utils

game_config = {
    "teamnames" : {"blue": "Scrikien", "red": "Cncters"},
    "runscoreboardtest" : False
}

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
    log("Game config change processed.")