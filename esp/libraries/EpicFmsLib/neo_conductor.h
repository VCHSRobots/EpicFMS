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
  void hitflash();
  void show_solidcolor(int r, int g, int b);
  void show_count(int n, int r, int g, int b);
  void show_one(int n, int r, int g, int b);
  void show_basketstatus(bool hiterror, bool stuck, bool jerking, long hitcount, long jamcount, float angle);
  void stage_groups(int nsize, int r1, int g1, int b1, int r2, int b2, int g2);
  void debug_report(void);

 private:
    Adafruit_NeoPixel _pixels1; // Strip 1, NULL if not used.
    Adafruit_NeoPixel _pixels2; // Strip 2, NULL if not used.
    int _neopin1;  // pin for first strip
    int _neopin2;  // pin for second strip
    int _npixels1;  // number of pixels in first strip
    int _npixels2;  // number of pixels in second strip
    bool _use1;
    bool _use2;
    int _np; // Number of actual pixels to use for animated sequences
    u_int32_t _lastupdatetime; // Last time update was called
    int _mode; // current mode
    
    void show(void);
    void stage_solidcolor(int r, int g, int b);    
};

#endif