// neo_conductor.h -- Managed Neo Pixel Strips for EpicFMS target units
// oct 2021

#ifndef NEO_CONDUCTOR_H
#define NEO_CONDUCTOR_H

#include <Adafruit_NeoPixel.h>
#include "gamemodes.h"

// The NeoConductor class manages all interaction with NeoPixels connected to this unit.
// There can be one or two strips connected, each with a different lenght of pixels.  
// The strips can animate in sync.  Various modes can be displayed, and are defined
// in gamemodes.h.

class NeoConductor {
 public:
 // NeoConductor constructor. Set pins to -1 or npixels to 0 to 
 // disable a strip.
  NeoConductor(int neopin1, int neopin2, int npixels1, int npixels2);
  void begin(void);
  void update(void);
  void setmode(int mode);
 private:
    int _neopin1;
    int _neopin2;
    int _npixels1;
    int _npixels2;
};

#endif