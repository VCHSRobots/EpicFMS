# target_manager.py -- manaages all the target units for the game
# dlb, Oct 2021
# Updated for SideQuest, Nov 2025

import slider_unit
import settings
import string
import json
from fmslogger import log

targets = []
nunits = {}

def set_up_targets():
    global targets, nunits
    config = settings.fms_config
    type = "sliders"
    islot = 0
    for k in config[type]:
        name, ip, en = k["name"], k["ip"], k["enabled"]
        u = slider_unit.SliderUnit(ip)
        if u is not None:
            u.set_enable(en)
            t = {"unit" : u, "type" : type, "slot" : islot, "config" : k, "name" : name, "enabled": en}
            targets.append(t)
            islot += 1
            nunits[type] = islot

def get_slider_status(i):
    info = {}
    for t in targets:
        if t["slot"] == i:
            u = t["unit"]
            info["name"] = t["name"]
            info["ip"] = u.get_ip()
            info["hits"] = u.get_hits()
            s = u.get_rawstatus()
            if s is None:
                info["status"] = "Off Line"
                return info 
            for k, v in s.items():
                info[k] = v 
            if not u.is_game_ready():
                info["status"] = "Not Ready"
            else:
                if info["slider"] == "Opened": info["status"] = "Opened"
                elif info["slider"] == "Closed": info["status"] = "Closed"
                elif info["slider"] == "Center": info["status"] = "Center"
                else: info["slider"] == "Error?"
            return info
    info["name"] = "<unknown>"
    info["ip"] = "--.--.--.--"
    info["hits"] = 0
    info["status"] = "P.ERR."
    return info

def begin_all():
    for t in targets:
        log("Starting Target unit. Type=%s, num=%d" % (t["type"], t["slot"]))
        t["unit"].begin()

def reload_all_targets():
    global targets, nunits
    log("Reloading all targets")
    for t in targets:
        log("Destroying Target unit. Type=%s, num=%d" % (t["type"], t["slot"]))
        t["unit"].destroy() 
    targets = [] 
    nunits = {}
    set_up_targets()
    begin_all()

def open_slider_units():
    for t in targets:
        if t["type"] == "sliders" and t["enabled"]:
            t["unit"].open_door()

def close_slider_units():
    for t in targets:
        if t["type"] == "sliders" and t["enabled"]:
            t["unit"].close_door()

def open_slider(i):
    t = find_target("sliders", i)
    t["unit"].open_door()

def close_slider(i):
    t = find_target("sliders", i)
    t["unit"].close_door()

def set_start_counts():
    for t in targets:
        t["unit"].reset_hits()
        t["unit"].reset_hits_on_unit()

def broadcast_status(gamemode):
    for t in targets:
        t["unit"].set_game_mode(gamemode)

def get_hits(unittype, unitnum):
    t = find_target(unittype, unitnum)
    if t is None: 
        log("Invalid args sent to get_hits: %s-%d" % (unittype, unitnum))
        return 0
    return t["unit"].get_raw_hits()

def target_okay(unittype, unitnum):
    t = find_target(unittype, unitnum)
    if t is not None:
        if not t["enabled"]: return False
        return t["unit"].is_game_ready()
    log("Invalid args sent to target_okay: %s-%d" % (unittype, unitnum))
    return False

def find_target(unittype, unitnum):
    for t in targets:
        if t["type"] == unittype and t["slot"] == unitnum: return t 
    return None

def is_slider_door_open(unitnum):
    t = find_target("sliders", unitnum)
    if t is None:
        log("Invalid arg set to slider_door_open()")
        return False
    return t["unit"].is_door_open()

def process_slider_commands(request, t):
    unitid = (t["type"], t["slot"])
    if request.args.get("open", -1) != -1:
        doit = int(request.args.get("open", 0))
        if doit == 1: 
            t["unit"].open_door()
            log("Open command sent to unit %s-%d" % unitid)
        return 
    if request.args.get("close", -1) != -1:
        doit = int(request.args.get("close", 0))
        if doit == 1: 
            t["unit"].close_door()
            log("Close command sent to unit %s-%d" % unitid)
        return 
    if request.args.get("center", -1) != -1:
        doit = int(request.args.get("center", 0))
        if doit == 1: 
            t["unit"].center_door()
            log("Center command sent to unit %s-%d" % unitid)
        return    
    if request.args.get("openpwm", -1) != -1:
        pwm =  int(request.args.get("openpwm", 0))
        t["unit"].set_open_pwm(pwm)
        log("Open pwm set to %d for unit %s-%d" % (pwm, unitid[0], unitid[1]))
        return
    if request.args.get("closepwm", -1) != -1:
        pwm =  int(request.args.get("closepwm", 0))
        t["unit"].set_close_pwm(pwm)
        log("Close pwm set to %d for unit %s-%d" % (pwm, unitid[0], unitid[1]))
        return
    if request.args.get("gamemode", -1) != -1:
        gm = request.requests.args.get("gamemode")
        t["unit"].set_game_mode(gm)
        log("Gamemode set to %s for unit %s-%d" % (gm, unitid[0], unitid[1]))
        return 
    if request.args.get("selftest", -1) != -1:
        t["unit"].run_detector_test()
        log("Selftest Performed for unit %s-%d" % unitid)
        return 
    if request.args.get("resethits", -1) != -1:
        t["unit"].reset_hits()
        t["unit"].reset_hits_on_unit()
        log("Hits Reset for unit %s-%d" % unitid)
        return
    if request.args.get("saveconfig", -1) != -1:
        t["unit"].save_config()
        log("Config saved for unit %s-%d" % unitid)
        return
    log("Invalid slider command.")

def extract_type_unit(request):
    unittype = request.args.get("unittype", "dummy")
    unitnum = request.args.get("unitnum", -1)
    if unittype == "dummy" or unitnum == -1: 
        log("Error. uinttype (%s) or unitnum (%d) is invalid. Command not processed." % (unittype, unitnum))
        return (None, None)
    if not unittype in nunits: 
        log("Error. Unknown unit type (%s). Command not processed." % unittype)
        return (None, None)
    try:
        iunitnum = int(unitnum)
    except BaseException:
        log("Error. unitnum is not a number (%s).Command not processed." % unitnum)
    nu = nunits[unittype]
    if iunitnum < 0 or iunitnum >= nu:
        log("Error. Unit number (%d) out of range (0-%d). Command not processed" % (unitnum, nu))
        return (None, None)
    t = None
    for k in targets:
        if k["type"] == unittype and k["slot"] == iunitnum: t = k 
    if t is None:
        log("Error. Unable to find unit type %s with index %d. Command not processed." & (unittype, iunitnum))
        return (None, None)
    return (unittype, iunitnum)

def process_admin_request(request):
    global targets, nunits
    # Handle all admin reqests that have to do
    # with configuration and individule target units.
    
    config = request.args.get("config", "dummy")
    if config != "dummy":
      okay = settings.set_config_base64json(config)
      if not okay: return 
      # Unfortunatly a config change means reloading everything
      reload_all_targets() 
      return

    # if the reequests falls to this point, it is
    # targeted for a specific unit.  To deal with 
    # that, the request must have a unit type, and
    # a unit number.
    log("Handling general unit admin command: %s" % request.url)
    unittype, unitnum = extract_type_unit(request)
    if unittype is None or unitnum is None: 
        log("Error -- Unable to extract unittype and number.")
        return
    t = find_target(unittype, unitnum)
    if t is None:
        log("Error -- unable to find target. type=%s, num=%d" % (unittype, unitnum))
        return 
    if unittype == "sliders": 
        process_slider_commands(request, t)
        return
    log("Error -- unknown target. type=%s, num=%d" % (unittype, unitnum))
    return 

def process_unitstatus_request(request):
    unittype, unitnum = extract_type_unit(request)
    if unittype is None or unitnum is None: return "{}"
    t = find_target(unittype, unitnum)
    if t is None:
        log("Error -- unable to find target. type=%s, num=%d" % (unittype, unitnum))
        return "{}"
    # log("Processing unit status request for type=%s num=%d." % (unittype, unitnum))
    status = t["unit"].get_rawstatus()
    if status is None: 
        if t["enabled"]:
            prgerr = t["unit"].progerror
            log("Status not valid from unit. unittype=%s, unitnum=%d, progerror=%d" % (unittype, unitnum, prgerr))
        return "{}"
    status["unittype"] = unittype
    status["unitnum"] = unitnum
    # log("type(status)", type(status))
    # log("status", status)
    try: 
        sj = json.dumps(status, indent=2)
    except BaseException as err:
        log("Error with converting to json. err={0}".format(err))
        return "{}"
    return sj

def process_blink(unit):
    n = len(unit)
    num = unit[n-1:n]
    if not num in string.digits: 
        log("Error on blink command. No digit found.")
        return 
    num = int(num) - 1
    if num < 0:
        log("Error on blink commmand.  digit too low.")
        return
    unittype = unit[0:n-1] + 's'
    t = find_target(unittype, num)
    if t is None:
        log("Error on blink command. Unable to find %s." % unit)
        return
    t["unit"].blink()
    log("Blink command executied. Cmd=%s" % unit)

