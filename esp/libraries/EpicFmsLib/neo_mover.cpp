// neo_mover.cpp -- Mover Status on Neo Strip
// dlb, Oct 2021

// This calls inherites NeoBase which does all the hard work in setting
// up the pattern on the LEDs.  Here we override some bahaviour to show
// when the battery is low, and when a hit is detected.

#include "neo_mover.h"

NeoMover::NeoMover(int neopin1, int neopin2, int npixels1, int npixels2) :
    NeoBase(neopin1, neopin2, npixels1, npixels2) {
    _newparams = false;
    _showing_hit = false;
    _showing_blink = false;
}

// Sets the current parameters
void NeoMover::set_params(Neo_Mover_Params *p) {
    _newparams = params_equal(&_parms, p);
    memcpy(&_parms, p, sizeof(Neo_Mover_Params));
}

// Flash the pixels for a hit.  For continueous hits, show some blinks.
void NeoMover::show_hit(void) {
    if (_showing_hit) {
        _showing_blink = true;
        _time_of_hit = millis();
        stage_solidcolor(ENEO_BLACK);
        show();
        return;
    }
    _showing_hit = true;
    _showing_blink = false;
    _time_of_hit = millis();
    stage_solidcolor(ENEO_WHITE);
    show();
}

// This smash function should be called by update when parameters change
// or fouce 
void NeoMover::smash(int gamemode, bool changed, uint32_t telp) {
    if (_showing_hit) {
        if(millis() - _time_of_hit > 50) {
            _showing_hit = false;
        }
    }
    if (_showing_hit) {
        if (_showing_blink) {
            if(millis() - _time_of_hit > 20) {
                _showing_blink = false;
            }
        }
        if (_showing_blink) stage_solidcolor(ENEO_BLACK);
        else                stage_solidcolor(ENEO_WHITE);
        _delay_time = 20; // return quickly
        return;
    }
  
    // If the battery is getting low, override bottome ring with
    // a system of red/blue.
    if (_parms.batterylow) {
        int np0 = _np / 2;
        int n = _np - np0;
        for (int i = 0; i < n; i++) {
            int indx = i + np0;
            set_pixel_color(indx, ENEO_BLACK);
   
        }
        for (int i = 0; i < n; i += 4) {
            int indx = i + np0;
            set_pixel_color(indx, ENEO_RED_DIM);
            set_pixel_color(indx + 1, ENEO_BLUE_DIM);
        }
    }
}

bool NeoMover::params_equal(Neo_Mover_Params *p1, Neo_Mover_Params *p2) {
    if (p1->game_mode != p2->game_mode) return false;
    if (p1->online != p2->online) return false;
    if (p1->hiterror != p2->hiterror) return false;
    if (p1->batterylow != p2->batterylow) return false;
    if (p1->hitcount != p2->hitcount) return false;
    return true;
}

