// neo_basket.cpp -- Basket Status on Neo Strip
// dlb, Oct 2021

// This class inherites NeoBase which does all the hard work in setting
// up the pattern on the LEDs.  Here we override some bahaviour to show
// when the battery is low, and when a hit is detected.

#include "neo_basket.h"

NeoBasket::NeoBasket(int neopin1, int neopin2, int npixels1, int npixels2) :
    NeoBase(neopin1, neopin2, npixels1, npixels2) {
    _newparams = false;
}

// Sets the current parameters
void NeoBasket::set_params(Neo_Basket_Params *p) {
    _newparams = params_equal(&_params, p);
    memcpy(&_params, p, sizeof(Neo_Basket_Params));
}

// This smash function will be called by update when parameters change
// or after last requested delay. 
void NeoBasket::smash(int gamemode, bool changed, uint32_t telp) {
    static int last_side = 0;
    if(_params.jerking) {
        if (last_side == 1) {
            stage_groups(4, ENEO_RED, ENEO_WHITE_DIM);
            last_side = 0;
        } else {
            stage_groups(4, ENEO_WHITE_DIM, ENEO_RED);
            last_side = 1;  
        }
        _delay_time = 150;
        return;
    }
    if(_params.hiterror) {
        if (last_side == 1) {
            stage_solidcolor(ENEO_RED_DIM);
            last_side = 0;
        } else {
            stage_solidcolor(ENEO_GREEN_DIM);
            last_side = 1;  
        }
        _delay_time = 150;
        return;
    }
     if (_params.stuck) {
        stage_solidcolor(ENEO_RED_DIM);
        _delay_time = 150;
        return;
    }
      
    int irevs = int(_params.revs);
    float frac = _params.revs - irevs;
    int indx = int(_np * frac);
    if (indx < 0) indx = 0; 
    if (indx >= _np) indx = _np - 1;
    set_pixel_color(indx, ENEO_WHITE);
}

bool NeoBasket::params_equal(Neo_Basket_Params *p1, Neo_Basket_Params *p2) {
    if (p1->game_mode != p2->game_mode) return false;
    if (p1->online != p2->online) return false;
    if (p1->hiterror != p2->hiterror) return false;
    if (p1->stuck != p2->stuck) return false;
    if (p1->jerking != p2->jerking) return false;
    if (p1->hitcount != p2->hitcount) return false;
    if (p1->jamcount != p2->jamcount) return false;
    if (p1->revs != p2->revs) return false;
    return true;
}
