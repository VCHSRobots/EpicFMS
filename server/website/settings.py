# settings.py -- holds global settings for the game
# dlb, Oct 2021

import json
import copy
import base64
from fmslogger import log

# This is the loaded version for use while running
fms_config = {
    "baskets" : [
        { "name" : "Basket-1", "ip" : "10.0.2.84", "enabled" : True, "team" : "red"},
        { "name" : "Basket-2", "ip" : "10.0.2.85", "enabled" : True, "team" : "blue"}
    ],
    "sliders" : [
        { "name" : "Slider-1", "ip" : "10.0.2.79", "enabled" : True, "team" : "red"},
        { "name" : "Slider-2", "ip" : "10.0.2.78", "enabled" : True, "team" : "blue"},
        { "name" : "Slider-3", "ip" : "10.0.2.75", "enabled" : True, "team" : "red"},
        { "name" : "Slider-4", "ip" : "10.0.2.83", "enabled" : True, "team" : "blue"},
        { "name" : "Slider-5", "ip" : "10.0.2.73", "enabled" : True, "team" : "red"},
        { "name" : "Slider-6", "ip" : "10.0.2.77", "enabled" : True, "team" : "blue"}
    ],
    "movers"  : [
        { "name" : "Mover-1", "ip" : "10.0.2.71", "enabled" : True, "team" : "red"},
        { "name" : "Mover-2", "ip" : "10.0.2.74", "enabled" : True, "team" : "blue"}
    ]
}

# If a conf file is not found, this will be loaded for running.
fms_defualt_config = {
    "baskets" : [
        { "name" : "Basket-1", "ip" : "10.0.2.84", "enabled" : True, "team" : "red"},
        { "name" : "Basket-2", "ip" : "10.0.2.85", "enabled" : True, "team" : "blue"}
    ],
    "sliders" : [
        { "name" : "Slider-1", "ip" : "10.0.2.79", "enabled" : True, "team" : "red"},
        { "name" : "Slider-2", "ip" : "10.0.2.78", "enabled" : True, "team" : "blue"},
        { "name" : "Slider-3", "ip" : "10.0.2.75", "enabled" : True, "team" : "red"},
        { "name" : "Slider-4", "ip" : "10.0.2.83", "enabled" : True, "team" : "blue"},
        { "name" : "Slider-5", "ip" : "10.0.2.73", "enabled" : True, "team" : "red"},
        { "name" : "Slider-6", "ip" : "10.0.2.77", "enabled" : True, "team" : "blue"}
    ],
    "movers"  : [
        { "name" : "Mover-1", "ip" : "10.0.2.71", "enabled" : True, "team" : "red"},
        { "name" : "Mover-2", "ip" : "10.0.2.74", "enabled" : True, "team" : "blue"}
    ]
}

def save_settings():
    global fms_config, fms_defualt_config
    try:
        f = open('fms_config.json', 'w') 
        json.dump(fms_config, f, indent=2)
        f.close()
    except BaseException as err:
        f.close()
        log("Unable to save settings. Error: {0}".format(err))
        return
    log("Configurtion Settings Saved")
    return
  
def load_settings():
    global fms_config, fms_defualt_config
    try: 
        f = open("fms_config.json", 'r')
    except BaseException as err:
        log("Unable to load settings. Error: {0}".format(err))
        log("Using default configuration.")
        fms_config = copy.deepcopy(fms_defualt_config)
        return
    try:
        fms_config = json.load(f) 
    except BaseException as err:
        log("Unable to decode settings. Error: {0}".format(err))
        log("Using default configuration.")
        fms_config = copy.deepcopy(fms_defualt_config)
        return
    f.close()
    log("Configuration Settings Loaded")

def load_defautls():
    global fms_config, fms_defualt_config 
    fms_config = copy.deepcopy(fms_defualt_config)
    return

def convert_to_index(x):
    try:
        i = int(x)
        return i
    except BaseException:
        return -1

def set_config_base64json(config):
    # Expects a json map encoded in base64.
    log("Setting Config.  Recevied Base64.")
    bconfig = config.encode('ascii')  # Produce a byte array of the ascii input
    bbconfig = base64.b64decode(bconfig) # Get a byte sequeence if ascii chars
    sconfig = bbconfig.decode('ascii') # Convert the bytes into a string.
    log("Recived this for config: " + sconfig)
    try:
        new_config = json.loads(sconfig)
    except BaseException as err:
        log("Unable to decode config input. Error: {0}".format(err))
        return False
    try:
        type = new_config["type"]
        unit = new_config["unit"]
    except BaseException as err:
        log("Required params not provided.  Unable to set config.")
        return False
    if not type in fms_config.keys():
        log("Unknown unit {0} in config. Unable to change config.".format(type))
        return False
    nobjs = len(fms_config[type])
    iunit = convert_to_index(unit)
    if iunit < 0 or iunit >= nobjs:
        log("Unit number is out of range {0}. Unable to change config.".format(unit))
        return False
    for k in new_config.keys():
        if k != "type" and k != "uint":
            log("Changing %s[%d].%s to %s" % (type, iunit, k, new_config[k]))
            fms_config[type][iunit][k] = new_config[k]
    log("Config change successful.")
    return True
    


    





