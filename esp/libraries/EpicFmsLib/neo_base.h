// neo_base.h -- base class for mananging dual neo strips
// dlb, Oct 2021

#ifndef NEO_BASE_H
#define NEO_BASE_H

#include <Adafruit_NeoPixel.h>
#include "gamemodes.h"

// The NeoBase class manages all interaction with NeoPixels connected to this unit.
// There can be one or two strips connected, each with a different lenght of pixels.  
// The strips can animate in sync.  Various modes can be displayed, and are defined
// in gamemodes.h.

// This class must be inherated to provide the functionality that is particular
// to each target type.

// These colors are used with the 32bit versions of the show calls.  
#define ENEO_WHITE      0x00FFFFFF
#define ENEO_WHITE_DIM  0x00C0C0C0
#define ENEO_RED        0x00FF0000
#define ENEO_RED_DIM    0x00C00000
#define ENEO_BLUE       0x000000FF
#define ENEO_BLUE_DIM   0x000000C0
#define ENEO_GREEN      0x0000FF00
#define ENEO_GREEN_DIM  0x0000C000
#define ENEO_YELLOW     0x00F5F505
#define ENEO_YELLOW_DIM 0x00B3B33D
#define ENEO_PINK       0x00FA07DA
#define ENEO_BLACK      0x00000000

class NeoBase {
 public:
   // NeoBase constructor. Set pins to -1 or npixels to 0 to 
   // disable a strip.
    NeoBase(int neopin1, int neopin2, int npixels1, int npixels2);
    void begin(void);
    void update(int gamemode);

    // Helper routines
 protected:
    virtual void smash(int gamemode, bool changed, uint32_t telp); // should be override!!
    void set_pixel_color(int indx, uint32_t c);
    void set_pixel_color(int indx, int r, int g, int b);
    void show(void);
    void stage_solidcolor(int r, int g, int b); 
    void stage_solidcolor(uint32_t c);
    void stage_count(int n, int r, int g, int b);
    void stage_count(int n, uint32_t c);
    void stage_one(int n, int r, int g, int b);
    void stage_one(int n, uint32_t c);
    void stage_groups(int nsize, uint32_t c1, uint32_t c2);
    void stage_groups_asymmetric(int nsize1, int nsize2, uint32_t c1, uint32_t c2);
    void stage_online(int game_mode, bool new_mode, uint32_t telp);

    Adafruit_NeoPixel _pixels1; // Strip 1.
    Adafruit_NeoPixel _pixels2; // Strip 2.
    int _neopin1;   // pin for first strip
    int _neopin2;   // pin for second strip
    int _npixels1;  // number of pixels in first strip
    int _npixels2;  // number of pixels in second strip
    bool _use1;     // if the first strip is being used
    bool _use2;     // if the second strip is begin used
    int _np;        // Number of actual pixels to use for animated sequences
    uint32_t _lastupdatetime; // Last time update was called
    uint32_t _delay_time = 0; // Delay time. Set by previous call.
    int _gamemode; // current game mode
};

#endif