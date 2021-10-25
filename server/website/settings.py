# settings.py -- holds global settings for the game
# dlb, Oct 2021

import json
import copy

# This is the loaded version for use while running
fms_config = {
    "baskets" : [
        { "name" : "Unit A", "ip" : "10.0.2.41", "enabled" : True},
        { "name" : "Unit B", "ip" : "", "enabled" : False},
        { "name" : "Unit C", "ip" : "", "enabled" : False},
        { "name" : "Unit D", "ip" : "", "enabled" : False}
    ],
    "sliders" : [
        { "name" : "Unit A", "ip" : "10.0.2.42", "enabled" : True},
        { "name" : "Unit B", "ip" : "", "enabled" : False},
        { "name" : "Unit C", "ip" : "", "enabled" : False},
        { "name" : "Unit D", "ip" : "", "enabled" : False},
        { "name" : "Unit E", "ip" : "", "enabled" : False},
        { "name" : "Unit F", "ip" : "", "enabled" : False}
    ],
    "movers"  : [
        { "name" : "Unit A", "ip" : "", "enabled" : False},
        { "name" : "Unit B", "ip" : "", "enabled" : False}
    ]
}

# If a conf file is not found, this will be loaded for running.
fms_defualt_config = {
    "baskets" : [
        { "name" : "Default A", "ip" : "10.0.2.41", "enabled" : True},
        { "name" : "Unit B", "ip" : "", "enabled" : False},
        { "name" : "Unit C", "ip" : "", "enabled" : False},
        { "name" : "Unit D", "ip" : "", "enabled" : False}
    ],
    "sliders" : [
        { "name" : "Unit A", "ip" : "10.0.2.42", "enabled" : True},
        { "name" : "Unit B", "ip" : "", "enabled" : False},
        { "name" : "Unit C", "ip" : "", "enabled" : False},
        { "name" : "Unit D", "ip" : "", "enabled" : False},
        { "name" : "Unit E", "ip" : "", "enabled" : False},
        { "name" : "Unit F", "ip" : "", "enabled" : False}
    ],
    "movers"  : [
        { "name" : "Unit A", "ip" : "", "enabled" : False},
        { "name" : "Unit B", "ip" : "", "enabled" : False}
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




