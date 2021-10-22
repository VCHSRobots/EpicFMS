# EPIC Robotz -- EPIC FMS 
## PCB Log

This file contains notes about all the PCBs that have been built for the EPIC FMS.

There are two versions (as of 10/21/21) of the pcb board.  The schematics are V4 for the
first version, and V5 for the second.  A run of 15 pcbs for each was manufactured.  These
are referred to as V1 and V2 of the PCB.  (Confusing, I know. Sorry.)

V1 boards are really no good without lots of modifications.  V2 boards also needed modification,
as follows:

    * HITRST was cut from SD3 and rerouted to D0
    * IDR1 was cut from D10, and rerouted to SD3
    * IRD2 was cut from D9 and rerouted to D2, replacing NEO2.

So, for now on, a V2 board with the above mods is refered to as a V3 board.  So far all V2 boards have been converted, so we only have V1 boards and V3 boards.  Moreover, all V1 boards in use have been moded for use in the basket targets, so they are not really V1 boards.

Finally, V1 boards are not numbered. (boo).

|SN     | Date Made | BType | Okay |HS |Mods| Notes                      |
|-------|-----------|-------|------|---|----| -------------------------- |
| A1    | Sept 21   | V1    |      |   |    |Original, made by Mr.B      |
| A2    | Sept 21   | V1    |  No  |   |    |Made by Chris, cap blew up  |
| A3    | Sept 21   | V1    |      |   | Y  |Many mods, For Basket       |
| 1     | 10/21/21  | V3    |      | Y |    |Runs pcb_test okay.         |
| 2     | 10/21/21  | V3    |      |   |    |Runs pcb_test okay.         |
| 3     | 10/21/21  | V3    |      |   |    |Runs pcb_test okay.         |
| 4     | 10/21/21  | V3    |      | Y |    |Runs pcb_test okay.         |
| 5     | 10/21/21  | V3    |      |   |    |Runs pcb_test okay.         |
| 6     | 10/21/21  | V3    |      | Y |    |Runs pcb_test okay.         |
| 7     | 10/21/21  | V3    |  No  |   |    |Fails test.                 |
| 8     | 10/21/21  | V3    |  No  |   |    |Fails test.                 |
| 9     | 10/21/21  | V3    |  No  | Y |    |Fails test.                 |
| 10    | 10/21/21  | V3    |  No  |   |    |Fails test.                 |
| 11    | 10/21/21  | V3    |  No  | Y |    |Fails test. Gets really hot.|
| 12    | 10/21/21  | V3    |  No  |   |    |Fails test.                 |
| 13    | 10/21/21  | V3    |  No  |   |    |Completely Ruined.          |
| 14    | 10/21/21  | V3    |  No  |   |    |Unfinished, needs ESP9266   |
