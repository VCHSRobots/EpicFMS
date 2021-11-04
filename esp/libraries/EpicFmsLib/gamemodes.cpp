// gamemodes.cpp -- conversion for Game Mode constants
// dlb, oct 2021

#include <ctype.h>
#include <string.h>
#include "gamemodes.h"

// Convert a GMODE constant to a string.
const char* gmode_to_str(int i) {
    switch(i) {
        default:
        case GMODE_NONE: return "None";        
        case GMODE_PWRUP: return "PowerUp";
        case GMODE_UNITERR: return "UnitError";
        case GMODE_WAITFORWIFI: return "WifiWait";   
        case GMODE_PRACTICE: return "Practice";
        case GMODE_STANDBY: return "Standby";
        case GMODE_MATCHCOUNTDOWN: return "CountDown";
        case GMODE_AUTO: return "Auto";
        case GMODE_TELEOP: return "TeleOp";
        case GMODE_MATCHFINAL: return "MatchFinal";
        case GMODE_POSTWAIT: return "PostWait";
        case GMODE_POSTRESULT: return "PostResult";
        case GMODE_FMSERROR: return "FmsError";
        case GMODE_FMSLOST: return "FmsLost";  
        case GMODE_BLINK: return "Blink";
    }
    return "";     
}

// Convert an integer to a GMODE constant.
int str_to_gmode(const char *str) {
    char a[20];
    for(int i = 0; i < 18 && str[i] != 0; i++) {
        a[i] = tolower(str[i]);
        a[i+1] = 0;
    }
    if (strcmp(a, "none") == 0) return GMODE_NONE;        
    if (strcmp(a, "powerup") == 0) return GMODE_PWRUP;
    if (strcmp(a, "uniterror") == 0) return GMODE_UNITERR;
    if (strcmp(a, "wifiwait") == 0) return GMODE_WAITFORWIFI;   
    if (strcmp(a, "practice") == 0) return GMODE_PRACTICE;
    if (strcmp(a, "standby") == 0) return GMODE_STANDBY;
    if (strcmp(a, "countdown") == 0) return GMODE_MATCHCOUNTDOWN;
    if (strcmp(a, "auto") == 0) return GMODE_AUTO;
    if (strcmp(a, "teleop") == 0) return GMODE_TELEOP;
    if (strcmp(a, "matchfinal") == 0) return GMODE_MATCHFINAL;
    if (strcmp(a, "postwait") == 0) return GMODE_POSTWAIT;
    if (strcmp(a, "postresult") == 0) return GMODE_POSTRESULT;
    if (strcmp(a, "fmserror") == 0) return GMODE_FMSERROR;
    if (strcmp(a, "fmslost") == 0) return GMODE_FMSLOST;    
    if (strcmp(a, "blink") == 0) return GMODE_BLINK;
    return GMODE_NONE; 
}
