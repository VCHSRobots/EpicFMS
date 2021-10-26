# settings.py -- holds global settings for the game
# dlb, Oct 2021

import json
import copy
import base64

# This is the loaded version for use while running
fms_config = {
    "baskets" : [
        { "name" : "Unit A", "ip" : "10.0.2.43", "enabled" : True, "team" : "red"},
        { "name" : "Unit B", "ip" : "", "enabled" : False, "team" : "blue"}
    ],
    "sliders" : [
        { "name" : "Unit A", "ip" : "10.0.2.42", "enabled" : True, "team" : "red"},
        { "name" : "Unit B", "ip" : "", "enabled" : False, "team" : "blue"},
        { "name" : "Unit C", "ip" : "", "enabled" : False, "team" : "red"},
        { "name" : "Unit D", "ip" : "", "enabled" : False, "team" : "blue"},
        { "name" : "Unit E", "ip" : "", "enabled" : False, "team" : "red"},
        { "name" : "Unit F", "ip" : "", "enabled" : False, "team" : "blue"}
    ],
    "movers"  : [
        { "name" : "Unit A", "ip" : "", "enabled" : False, "team" : "red"},
        { "name" : "Unit B", "ip" : "", "enabled" : False, "team" : "blue"}
    ]
}

# If a conf file is not found, this will be loaded for running.
fms_defualt_config = {
    "baskets" : [
        { "name" : "Default A", "ip" : "10.0.2.43", "enabled" : False, "team" : "red"},
        { "name" : "Unit B", "ip" : "", "enabled" : False, "team" : "blue"}
    ],
    "sliders" : [
        { "name" : "Unit A", "ip" : "10.0.2.42", "enabled" : False, "team" : "red"},
        { "name" : "Unit B", "ip" : "", "enabled" : False, "team" : "blue"},
        { "name" : "Unit C", "ip" : "", "enabled" : False, "team" : "red"},
        { "name" : "Unit D", "ip" : "", "enabled" : False, "team" : "blue"},
        { "name" : "Unit E", "ip" : "", "enabled" : False, "team" : "red"},
        { "name" : "Unit F", "ip" : "", "enabled" : False, "team" : "blue"}
    ],
    "movers"  : [
        { "name" : "Unit A", "ip" : "", "enabled" : False, "team" : "red"},
        { "name" : "Unit B", "ip" : "", "enabled" : False, "team" : "blue"}
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
        print("Unable to save settings. Error: {0}".format(err))
        return
    print("Configurtion Settings Saved")
    return
  
def load_settings():
    global fms_config, fms_defualt_config
    try: 
        f = open("fms_config.json", 'r')
    except BaseException as err:
        print("Unable to load settings. Error: {0}".format(err))
        print("Using default configuration.")
        fms_config = copy.deepcopy(fms_defualt_config)
        return
    try:
        fms_config = json.load(f) 
    except BaseException as err:
        print("Unable to decode settings. Error: {0}".format(err))
        print("Using default configuration.")
        fms_config = copy.deepcopy(fms_defualt_config)
        return
    f.close()
    print("Configuration Settings Loaded")


def convert_to_index(x):
    try:
        i = int(x)
        return i
    except BaseException:
        return -1

def set_config_base64json(config):
    # Expects a json map encoded in base64.
    print("Setting Config.  Recevied Base64.")
    bconfig = config.encode('ascii')  # Produce a byte array of the ascii input
    bbconfig = base64.b64decode(bconfig) # Get a byte sequeence if ascii chars
    sconfig = bbconfig.decode('ascii') # Convert the bytes into a string.
    print("Recived this for config: ", sconfig)
    try:
        new_config = json.loads(sconfig)
    except BaseException as err:
        print("Unable to decode config input. Error: {0}".format(err))
        return False
    try:
        type = new_config["type"]
        unit = new_config["unit"]
    except BaseException as err:
        print("Required params not provided.  Unable to set config.")
        return False
    if not type in fms_config.keys():
        print("Unknown unit {0} in config. Unable to change config.".format(type))
        return False
    nobjs = len(fms_config[type])
    iunit = convert_to_index(unit)
    if iunit < 0 or iunit >= nobjs:
        print("Unit number is out of range {0}. Unable to change config.".format(unit))
        return False
    for k in new_config.keys():
        if k != "type" and k != "uint":
            print("Changing %s[%d].%s to %s" % (type, iunit, k, new_config[k]))
            fms_config[type][iunit][k] = new_config[k]
    print("Config change successful.")
    return True
    


    





