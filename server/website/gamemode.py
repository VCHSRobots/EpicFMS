# gamemode.py -- Defines allowable game modes.
# dlb, Oct 2021

# Note: these definations MUST match the definations used
# in the ESP8266 devices, found in esp/libraries/gamemodes.h

GMODE_NONE           =  0  # The is an "undfined" mode -- should never be used. Treat as error.
GMODE_PWRUP          =  1  # This unit is powering up, doing selftest
GMODE_UNITERR        =  2  # This unit has detected an error that prevents play
GMODE_WAITFORWIFI    =  3  # This unit is waiting for a wifi connection
GMODE_PRACTICE       =  4  # This unit is in practice mode (counts hits only)
GMODE_STANDBY        =  5  # FMS Connected: waiting for the start of a match
GMODE_MATCHCOUNTDOWN =  6  # FMS Connected: We are counting down before a match start
GMODE_AUTO           =  7  # FMS Connected: The match is in auto mode
GMODE_TELEOP         =  8  # FMS Connected: The match is in teleop mode
GMODE_MATCHFINAL     =  9  # FMS Connected: The match is in teleop mode, but near the end of the match
GMODE_POSTWAIT       = 10  # FMS Connected: The match is concluded, but results not declared
GMODE_POSTRESULT     = 11  # FMS Connected: The match is concluded and results declared
GMODE_FMSERROR       = 12  # FMS Connected: There is an FMS error preventing match start
GMODE_FMSLOST        = 13  # FMS Disconnected: Error -- Lost connection during match
GMODE_BLINK          = 14  # Blink for debug and config purposes

def gmode_to_str(i):
    # Convert a GMODE constant to a string
    if i == GMODE_NONE: return "None"        
    if i == GMODE_PWRUP: return "PowerUp"
    if i == GMODE_UNITERR: return "UnitError"
    if i == GMODE_WAITFORWIFI: return "WifiWait"  
    if i == GMODE_PRACTICE: return "Practice"
    if i == GMODE_STANDBY: return "Standby"
    if i == GMODE_MATCHCOUNTDOWN: return "CountDown"
    if i == GMODE_AUTO: return "Auto"
    if i == GMODE_TELEOP: return "TeleOp"
    if i == GMODE_MATCHFINAL: return "MatchFinal"
    if i == GMODE_POSTWAIT: return "PostWait"
    if i == GMODE_POSTRESULT: return "PostResult"
    if i == GMODE_FMSERROR: return "FmsError"
    if i == GMODE_FMSLOST: return "FmsLost"  
    if i == GMODE_BLINK: return "Blink"
    return ""   

def str_to_gmode(str):
    # Convert an integer to a GMODE constant.
    s = str.lower().strip()
    if s == "none": return GMODE_NONE
    if s == "powerup": return GMODE_PWRUP
    if s == "uniterror": return GMODE_UNITERR
    if s == "wifiwait": return GMODE_WAITFORWIFI   
    if s == "practice": return GMODE_PRACTICE
    if s == "standby": return GMODE_STANDBY
    if s == "countdown": return GMODE_MATCHCOUNTDOWN
    if s == "auto": return GMODE_AUTO
    if s == "teleop": return GMODE_TELEOP
    if s == "matchfinal": return GMODE_MATCHFINAL
    if s == "postwait": return GMODE_POSTWAIT
    if s == "postresult": return GMODE_POSTRESULT
    if s == "fmserror": return GMODE_FMSERROR
    if s == "fmslost": return GMODE_FMSLOST
    if s == "blink": return GMODE_BLINK    
    return GMODE_NONE
