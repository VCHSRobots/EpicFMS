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

10/29: Update on mods:  It has been found that HITRST to D0 causes problems. Since 
HITRST is a minor feature, this mod may not be found on many boards.

### Manufacturing Log

|SN     | Date Made | BType | Okay |HS |Mods| Notes                      |How Used  |
|-------|-----------|-------|------|---|----| -------------------------- |----------|
| A1    | Sept 21   | V1    |      |   |    |Original, made by Mr.B      |          |
| A2    | Sept 21   | V1    |  No  |   |    |Made by Chris, cap blew up  |          |
| A3    | Sept 21   | V1    |      |   | Y  |Many mods, For Basket       | Basket   |
| 1     | 10/21/21  | V3    |      | Y |    |Runs pcb_test okay.         | Mover    |
| 2     | 10/21/21  | V3    |  No  |   |    |Runs pcb_test okay.         |          | 
| 3     | 10/21/21  | V3    |      |   |    |Runs pcb_test okay.         | Slider   |
| 4     | 10/21/21  | V3    |      | Y |    |Runs pcb_test okay.         | Mover    |
| 5     | 10/21/21  | V3    |      |   |    |Bad Mod, now okay.          | Slider   |
| 6     | 10/21/21  | V3    |      | Y |    |Runs pcb_test okay.         |          |
| 7     | 10/21/21  | V3    |      |   |    |Works on Slider Ring.       | Slider   |
| 8     | 10/21/21  | V3    |      |   |    |Works on Slider Ring.       | Slider   |
| 9     | 10/21/21  | V3    |      | Y |    |Works on Slider Ring.       | Slider   |
| 10    | 10/21/21  | V3    |      |   |    |Works on Slider Ring.       |          |
| 11    | 10/21/21  | V3    |  No  | Y |    |Fails test. Gets really hot.|          |
| 12    | 10/21/21  | V3    |  No  |   |    |** See notes below          |          |
| 13    | 10/21/21  | V3    |      |   |    |Fixed with Paul's Help      | Slider   |

HS=HeatSink

### Address Assignements

|Board  |WiFi Name   |Mac               |IP Addr    |How Used |
|-------|------------|------------------|-----------|---------|
|PCB-A3 |Basket-1    |BC:FF:4D:2B:AD:82 |10.0.2.60  | Basket  |  
|PCB-01 |Mover-1     |30:83:98:B6:34:A1 |10.0.2.71  | Mover   |  
|PCB-03 |Slider-1    |8C:CE:4E:E3:42:36 |10.0.2.73  | Slider  |  
|PCB-04 |Mover-2     |A8:48:FA:C0:81:A7 |10.0.2.74  | Mover   |  
|PCB-05 |Slider-2    |30:83:98:B5:5D:FF |10.0.2.75  | Slider  |  
|PCB-07 |Slider-3    |BC:FF:4D:2B:A7:02 |10.0.2.77  | Slider  | 
|PCB-08 |Slider-6    |BC:FF:4D:2B:4B:14 |10.0.0.78  | Slider  |
|PCB-09 |Slider-5    |BC:FF:4D:2B:36:0B |10.0.2.79  | Slider  |  
|PCB-13 |Slider-4    |BC:FF:4D:2A:EB:3D |10.0.2.83  | Slider  |  

IP addresses are fixed to MAC addresses and assigned by the LinkSys router,
via DHCP. The scheme is to tie address to Board SN, the V1 boards (A series) start 
at 10.0.0.60, and the V3 boards start at 10.0.2.71.  

The above scheme is not strickly necessary, but helps with the 
default assignments in the Epic FMS web server.


### Work Log

Work on Tuesday, 10/26:
PCB-2 was in first Ring, working great.  Working on second ring
and hooked it up to PCB-2. PCB-2 got really hot.  After cooling, one of
the IR beams will not work.  It still connects, but suppected burnout
on GPIO pins.

PCB-5 was also used on bad ring.  It will connect, but will not
work with the IR Beams.  Suppected burnout on GPIO pins.

Work on Thrusday, 10/28:
PCB-5 was misswired, a bad mod. Fixed the mod, and PCB-5 now okay.
Also, resodered PCB-13, works not.  And finshed PCB-12 with new ESP, and
something seems to be wrong... Set aside for debugging later.

Work on Monday, 11/1
PCB-12 was seemed okay at first, but then it wouldn't read one
of the ir beams on a ring.  Later, it will connect to a PC but
it won't accept an upload.

After more work with the test jig, I discovered that there is
cross-talk among the beams.  I tested PCB-6, PCB-8, PCB-9 and
PCB-10 on slider rings -- and they all work.  Before, PCB-8, PCB-9,
and PCB-10 failed the test on the test jig.





