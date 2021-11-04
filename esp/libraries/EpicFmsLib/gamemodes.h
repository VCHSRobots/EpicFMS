// gamemodes.h -- Define various game modes -- useful for Neo Pixels 

#ifndef GAMEMODES_H
#define GAMEMODES_H

#define GMODE_NONE           0  // The is an "undfined" mode -- should never be used. Treat as error.
#define GMODE_PWRUP          1  // This unit is powering up, doing selftest
#define GMODE_UNITERR        2  // This unit has detected an error that prevents play
#define GMODE_WAITFORWIFI    3  // This unit is waiting for a wifi connection
#define GMODE_PRACTICE       4  // This unit is in practice mode (counts hits only)
#define GMODE_STANDBY        5  // FMS Connected: waiting for the start of a match
#define GMODE_MATCHCOUNTDOWN 6  // FMS Connected: We are counting down before a match start
#define GMODE_AUTO           7  // FMS Connected: The match is in auto mode
#define GMODE_TELEOP         8  // FMS Connected: The match is in teleop mode
#define GMODE_MATCHFINAL     9  // FMS Connected: The match is in teleop mode, but near the end of the match
#define GMODE_POSTWAIT      10  // FMS Connected: The match is concluded, but results not declared
#define GMODE_POSTRESULT    11  // FMS Connected: The match is concluded and results declared
#define GMODE_FMSERROR      12  // FMS Connected: There is an FMS error preventing match start
#define GMODE_FMSLOST       13  // FMS Disconnected: Error -- Lost connection during match
#define GMODE_BLINK         14  // Blink for debugging and configuration purposes.

const char *gmode_to_str(int i);
int str_to_gmode(const char* str);

#endif

