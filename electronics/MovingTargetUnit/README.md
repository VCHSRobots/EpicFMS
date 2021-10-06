### PCB for Moving Tareget Unit
**Oct 2021 EPIC Robotz**

As of 10/6/21, Two PCBs have been manufactured:

Verion 1:  Submitted for manufacturing on Friday, 9/24/21. Recived on 10/1/21.  This was based on V4 of the schematic.
Problems found:
1. Voltagle regulars overheat.  Since one of these powers sensors as well as neopixles, entire circult fails in about 2 minutes.
2. The outputs of the IR detectors are wired to pins that must be held in special conditions during startup -- this causes boot up problems.
3. The USB power flows back into the voltage regulators, causing confusion during developement.  Also, since USB power is tied directly
to input battery terminals, damage to a host computer might be possible during development.
4. The NEO pixels are driven directly from the ESP9266, at 3.3v.  It should be closer to 5v for reliable operation.

Verion 2: Submitted for manufacturing on Tuesday, 10/5/21.  This was based on V5 of the schematic. 
Hopefully, above problems fixed.

