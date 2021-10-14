// neo_conductor.h -- Managed Neo Pixel Strips for EpicFMS target units
// oct 2021

#ifndef NEO_CONDUCTOR_H
#define NEO_CONDUCTOR_H

#include <Adafruit_NeoPixel.h>
#include "gamemodes.h"

// This structure is used for the basket target.
typedef struct neo_basket_params {
    int game_mode;
    bool online;
    bool hiterror;
    bool stuck;
    bool jerking;
    long hitcount;
    long jamcount;
    float revs;
} Neo_Basket_Params;

// The NeoConductor class manages all interaction with NeoPixels connected to this unit.
// There can be one or two strips connected, each with a different lenght of pixels.  
// The strips can animate in sync.  Various modes can be displayed, and are defined
// in gamemodes.h.

// These colors are used with the 32bit versions of the show calls. Note
// that they are specified as g-r-b instead of r-g-b.  This is to accomodate
// the strange LED strips that we are working with.
#define ENEO_WHITE      0x00FFFFFF
#define ENEO_WHITE_DIM  0x00C0C0C0
#define ENEO_RED        0x0000FF00
#define ENEO_RED_DIM    0x0000C000
#define ENEO_BLUE       0x000000FF
#define ENEO_BLUE_DIM   0x000000C0
#define ENEO_GREEN      0x00FF0000
#define ENEO_GREEN_DIM  0x00C00000
#define ENEO_YELLOW     0x00EBF218
#define ENEO_PINK       0x0018F2E7  
#define ENEO_BLACK      0x00000000

class NeoConductor {
 public:
   // NeoConductor constructor. Set pins to -1 or npixels to 0 to 
   // disable a strip.
    NeoConductor(int neopin1, int neopin2, int npixels1, int npixels2);
    void begin(void);
    void update(void);
    void setmode(int mode);
    void hitflash(void);
    void debug_report(void);

    // Helper routines
    void set_pixel_color(int i, uint32_t c);
    void show(void);
    void stage_solidcolor(int r, int g, int b); 
    void stage_solidcolor(uint32_t c);
    void show_solidcolor(int r, int g, int b);
    void show_solidcolor(uint32_t c);
    void show_count(int n, int r, int g, int b);
    void show_count(int n, uint32_t c);
    void show_one(int n, int r, int g, int b);
    void show_one(int n, uint32_t c);
    void stage_groups(int nsize, uint32_t c1, uint32_t c2);
    void stage_groups_asymmetric(int nsize1, int nsize2, uint32_t c1, uint32_t c2);

    // Special "update" calls.  Do this instead of update for basket targets...
    void show_basketstatus(Neo_Basket_Params *params);

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
    uint32_t _lastupdatetime; // Last time update was called
    uint32_t _delay_time = 0; // Delay time. Set by previous call.
    int _mode; // current mode
    
    // Stuff for Basket Target:
    Neo_Basket_Params _last_basket_params;
    bool neo_basket_params_equal(Neo_Basket_Params *p1, Neo_Basket_Params *p2);
    void stage_basket_online(Neo_Basket_Params *p, bool same, uint32_t telp);
    void stage_basket_offline(Neo_Basket_Params *p, bool same, uint32_t telp);

};

#endif