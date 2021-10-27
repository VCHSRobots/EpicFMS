# target_manager.py -- manaages all the target units for the game
# dlb, Oct 2021

import basket_unit
import slider_unit
import settings
import json
from fmslogger import log

targets = []
nunits = {}

def set_up_targets():
    global targets, nunits
    config = settings.fms_config
    for type in ("baskets", "sliders", "movers"):
        islot = 0
        for k in config[type]:
            name, ip, en, team = k["name"], k["ip"], k["enabled"], k["team"]
            if type == "baskets": u = basket_unit.BasketUnit(ip)
            if type == "sliders": u = slider_unit.SliderUnit(ip)
            if type == "movers": u = None
            if u is not None:
                u.set_enable(en)
                t = {"unit" : u, "type" : type, "slot" : islot, "config" : k, "team": team, "name" : name}
                targets.append(t)
                islot += 1
        nunits[type] = islot

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

def get_hits():
    red, blue = 0, 0
    for t in targets:
        if t["team"] == "red": red += t["unit"].get_hits() 
        if t["team"] == "blue": blue += t["unit"].get_hits()
    return (red, blue)

def find_target(unittype, unitnum):
    for t in targets:
        if t["type"] == unittype and t["slot"] == unitnum: return t 
    return None

def process_basket_commands(request, t):
    if request.args.get("motor", -1) != -1:
        enable = int(request.args.get("motor", 0))
        log("Enable = %d" % enable)
        if enable == 1: t["unit"].turn_motor_on()
        else:           t["unit"].turn_motor_off()
    basketmode = request.args.get("basketmode", "dummy")
    if basketmode != "dummy":
        t["unit"].set_game_mode(basketmode)

def process_slider_commands(request, t):
    if request.args.get("open", -1) != -1:
        doit = int(request.args.get("open", 0))
        if doit == 1: t["unit"].open_door()
        return 
    if request.args.get("close", -1) != -1:
        doit = int(request.args.get("close", 0))
        if doit == 1: t["unit"].close_door()
        return 
    if request.args.get("center", -1) != -1:
        doit = int(request.args.get("center", 0))
        if doit == 1: t["unit"].center_door()
        return    
    if request.args.get("openpwm", -1) != -1:
        pwm =  int(request.args.get("openpwm", 0))
        t["unit"].set_open_pwm(pwm)
        return
    if request.args.get("closepwm", -1) != -1:
        pwm =  int(request.args.get("closepwm", 0))
        t["unit"].set_close_pwm(pwm)
        return
    if request.args.get("gamemode", -1) != -1:
        gm = request.requests.args.get("gamemode")
        t["unit"].set_game_mode(gm)
        return 
    if request.args.get("selftest", -1) != -1:
        t["unit"].run_detector_test()
        return 
    if request.args.get("resethits", -1) != -1:
        t["unit"].reset_hits()
        t["unit"].reset_hits_on_unit()
        return
    if request.args.get("saveconfig", -1) != -1:
        t["unit"].save_config()
        return
    log("Invalid slider command.")

def process_mover_commands(request, t):
    pass

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
    log("Handling general unit admin command.")
    unittype, unitnum = extract_type_unit(request)
    if unittype is None or unitnum is None: return
    t = find_target(unittype, unitnum)
    if t is None:
        log("Error -- unable to find target. type=%s, num=%d" % (unittype, unitnum))
        return 
    if unittype == "baskets": 
        process_basket_commands(request, t)
        return
    if unittype == "sliders": 
        process_slider_commands(request, t)
        return
    if unittype == "movers" : 
        process_mover_commands(request, t)
        return
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
        log("Status not valid from unit.")
        return "{}"
    # log("type(status)", type(status))
    # log("status", status)
    try: 
        sj = json.dumps(status, indent=2)
    except BaseException as err:
        log("Error with converting to json. err={0}".format(err))
        return "{}"
    return sj