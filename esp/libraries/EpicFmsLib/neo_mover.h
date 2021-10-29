// neo_mover.h -- sub class for managing neo strip on mover targer
// dlb, Oct 2021

#ifndef NEO_MOVER_H
#define NEO_MOVER_H

#include "neo_base.h"

// This structure is used for the mover target.
typedef struct neo_mover_params {
    int game_mode;
    bool online;
    bool hiterror;
    long hitcount;
    bool batterylow;
} Neo_Mover_Params;

class NeoMover : public NeoBase {
 public:
    NeoMover(int neopin1, int neopin2, int npixels1, int npixels2);
    
    void set_params(Neo_Mover_Params *p);
    void smash(int gamemode, bool changed, uint32_t telp);
    void show_hit(void);

 
 protected:
    Neo_Mover_Params _parms;
    bool _newparams;
    bool params_equal(Neo_Mover_Params *p1, Neo_Mover_Params *p2);  
    bool _showing_hit; 
    bool _showing_blink;
    uint32_t _time_of_hit;

};

#endif