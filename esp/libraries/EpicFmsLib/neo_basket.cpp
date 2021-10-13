// neo_basket.cpp -- Basket Status on Neo Strip -- for Offline and Debug modes
// dlb, Oct 2021

#include "neo_conductor.h"
// This code is part of the NeoConductor class...

// Shows the basket status for practice and debug mode on the basket.
// Design: Hits are Green, Jams are Orange, Angle is White.  Jerking is Red/white back and forth.
// Stuck is red. Count Error is alternating Red/Green.
void NeoConductor::show_basketstatus(bool hiterror, bool stuck, bool jerking, long hitcount, long jamcount, float revs) {
    // if inputs the same, don't do anything
    static bool last_hiterror = true;
    static bool last_stuck = true;
    static bool last_jerking = true;
    static long last_hitcount = -10;
    static long last_jamcount = -10;
    static float last_revs = -10.0;
    static uint32_t last_time = -1;
    static int last_side = 0;

    bool param_changed = false;
    if (last_hiterror != hiterror || last_stuck != stuck || last_jerking != jerking || last_hitcount != hitcount
        || last_jamcount != jamcount || revs != last_revs) {
        param_changed = true;
        last_hiterror = hiterror;
        last_stuck = stuck;
        last_jerking = jerking;
        last_hitcount = hitcount;
        last_jamcount = jamcount;
        last_revs = revs;
    }
    uint32_t tnow = millis();
    uint32_t elp = tnow - last_time;
    if(jerking) {
        if (elp < 150) return;
        last_time = tnow;
        if (last_side == 1) {
            stage_groups(4, 255, 0, 0, 128, 128, 128);
            show();
            last_side = 0;
        } else {
            stage_groups(4, 128, 128, 128, 255, 0, 0);
            last_side = 1;  
        }
        show();
        return;
    }

    if(hiterror) {
        if (elp < 150) return;
        last_time = tnow;
        if (last_side == 1) {
            show_solidcolor(129, 0, 0);
            last_side = 0;
        } else {
            show_solidcolor(0, 129, 0);
            last_side = 1;  
        }
        show();
        return;
    }
    if(!param_changed) return;
    if (stuck) {
        show_solidcolor(192, 0, 0);
        return;
    }

    int nhitsmax = int(2 * _np / 3);
    int njamsmax = _np - nhitsmax;
    int nhitshow = hitcount % nhitsmax;
    int njamshow = jamcount % njamsmax;

    stage_solidcolor(0, 0, 0);
    for(int i = 0; i < nhitshow; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(255, 0, 0));   // g, r, b
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(255, 0, 0)); 
    }
    for(int i = 0; i < njamshow; i++) {
        if(_use1) _pixels1.setPixelColor(_np - 1 - i, _pixels1.Color(65, 128, 0));
        if(_use2) _pixels2.setPixelColor(_np - 1 - i, _pixels2.Color(65, 128, 0));    
    }

    int irevs = int(revs);
    float frac = revs - irevs;
    int indx = int(_np * frac);
    if (indx < 0) indx = 0; 
    if (indx >= _np) indx = _np - 1;
    if(_use1) _pixels1.setPixelColor(indx, _pixels1.Color(255, 255, 255));
    if(_use2) _pixels2.setPixelColor(indx, _pixels2.Color(255, 255, 255));
    show();
}