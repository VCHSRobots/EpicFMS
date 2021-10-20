// neo_basket.cpp -- Basket Status on Neo Strip -- for Offline and Debug modes
// dlb, Oct 2021

#include "neo_conductor.h"
// This code is part of the NeoConductor class...

bool NeoConductor::neo_basket_params_equal(Neo_Basket_Params *p1, Neo_Basket_Params *p2) {
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


void NeoConductor::stage_basket_online(Neo_Basket_Params *p, bool same, uint32_t telp) {
    static int last_side = 0;
    static int update_count = 0;
    switch(p->game_mode) {
        case GMODE_NONE:     // Horriable Programming Error:  red/yellow @ fast
            if (last_side == 1) {
                stage_groups(2, ENEO_RED_DIM, ENEO_YELLOW);
                show();
                last_side = 0;
            } else {
                stage_groups(2, ENEO_YELLOW, ENEO_RED_DIM);
                last_side = 1;  
            }
            show();
            _delay_time = 50;
            return;
        case GMODE_WAITFORWIFI: // Slow blue Creep...
            update_count++;
            if (update_count < 10) { _delay_time = 50; return;}
            update_count = 0;
            last_side++;
            if (last_side > 20) last_side = 0;
            if(last_side <= 10) {
                stage_groups_asymmetric(last_side, 10-last_side, ENEO_BLUE, ENEO_BLACK);
            } else {
                int i = 20-last_side;
                stage_groups_asymmetric(10-i, i, ENEO_BLACK, ENEO_BLUE);
            }
            show();
            _delay_time = 50;
            return;
        case GMODE_FMSLOST:  // Blue creep with RED background
            update_count++;
            if (update_count < 10) { _delay_time = 50; return;}
            update_count = 0;
            last_side++;
            if (last_side > 20) last_side = 0;
            if(last_side <= 10) {
                stage_groups_asymmetric(last_side, 10-last_side, ENEO_BLUE, ENEO_RED_DIM);
            } else {
                int i = 20-last_side;
                stage_groups_asymmetric(10-i, i, ENEO_RED_DIM, ENEO_BLUE);
            }
            show();
            _delay_time = 50;
            return;
        case GMODE_STANDBY:  // Green Creep -- slightly faster than blue
            update_count++;
            if (update_count < 6) { _delay_time = 50; return;}
            update_count = 0;
            last_side++;
            if (last_side > 20) last_side = 0;
            if(last_side <= 10) {
                stage_groups_asymmetric(last_side, 10-last_side, ENEO_GREEN, ENEO_BLACK);
            } else {
                int i = 20-last_side;
                stage_groups_asymmetric(10-i, i, ENEO_BLACK, ENEO_GREEN);
            }
            show();
            _delay_time = 50;
            return;
        case GMODE_PWRUP:
             if (last_side>_np) { last_side=0; return;}
             show_one(last_side, 200, 0, 0);
             _delay_time = 100;
             last_side++;
            return;
        case GMODE_UNITERR:
            update_count++;
            if (update_count < 1) { _delay_time = 10; return;
            show_solidcolor(0, 0, 0);
            }
            update_count = 0;
             if (last_side>_np) { last_side=0; return;}
             show_one(last_side, 150, 255, 0);
             _delay_time = 10;
             last_side++;
             return;
        case GMODE_PRACTICE:
            if (last_side> 254) { last_side=0; return;}
             show_solidcolor(0, 0, last_side);
             _delay_time = 10;
             last_side++;
             return;
        default: // All other modes for now... pink blink
            last_side++;
            if (last_side == 1) {
                show_solidcolor(ENEO_PINK);
                last_side = 0;
            } else {
                show_solidcolor(ENEO_YELLOW);
                last_side = 1;
            }
            _delay_time = 50;
            return;
    }
}
// Shows the basket status for practice and debug mode on the basket.
// Design: Hits are Green, Jams are Orange, Angle is White.  Jerking is Red/white back and forth.
// Stuck is red. Count Error is alternating Red/Green.
void NeoConductor::stage_basket_offline(Neo_Basket_Params *p, bool same, uint32_t telp) {
    int nhitsmax = int(2 * _np / 3);
    int njamsmax = _np - nhitsmax;
    int nhitshow = p->hitcount % nhitsmax;
    int njamshow = p->jamcount % njamsmax;

    stage_solidcolor(ENEO_BLACK);
    for(int i = 0; i < nhitshow; i++) {
        if(_use1) _pixels1.setPixelColor(i, ENEO_GREEN);   // g, r, b
        if(_use2) _pixels2.setPixelColor(i, ENEO_GREEN); 
    }
    for(int i = 0; i < njamshow; i++) {
        if(_use1) _pixels1.setPixelColor(_np - 1 - i, _pixels1.Color(65, 128, 0));
        if(_use2) _pixels2.setPixelColor(_np - 1 - i, _pixels2.Color(65, 128, 0));    
    }
    _delay_time = 150;
}

// Shows the basket status for practice and debug mode on the basket.
// Design: Hits are Green, Jams are Orange, Angle is White.  Jerking is Red/white back and forth.
// Stuck is red. Count Error is alternating Red/Green.
void NeoConductor::show_basketstatus(Neo_Basket_Params *p) {
    static int last_side = 0;
    bool params_changed = neo_basket_params_equal(&_last_basket_params, p);
    memcpy(&_last_basket_params, p, sizeof(Neo_Basket_Params));
    uint32_t tnow = millis();
    uint32_t telp = tnow - _lastupdatetime;
    //if (!params_changed && telp < _delay_time) return;
    if(telp < _delay_time) return;
    _lastupdatetime = tnow;

    if(p->jerking) {
        if (last_side == 1) {
            stage_groups(4, ENEO_RED, ENEO_WHITE_DIM);
            show();
            last_side = 0;
        } else {
            stage_groups(4, ENEO_WHITE_DIM, ENEO_RED);
            last_side = 1;  
        }
        show();
        _delay_time = 150;
        return;
    }
    if(p->hiterror) {
        if (last_side == 1) {
            show_solidcolor(ENEO_RED_DIM);
            last_side = 0;
        } else {
            show_solidcolor(ENEO_GREEN_DIM);
            last_side = 1;  
        }
        show();
        _delay_time = 150;
        return;
    }
     if (p->stuck) {
        show_solidcolor(ENEO_RED_DIM);
        _delay_time = 150;
        return;
    }

    if (p->online) stage_basket_online(p, params_changed, telp);
    else           stage_basket_offline(p, params_changed, telp);
        
    int irevs = int(p->revs);
    float frac = p->revs - irevs;
    int indx = int(_np * frac);
    if (indx < 0) indx = 0; 
    if (indx >= _np) indx = _np - 1;
    if(_use1) _pixels1.setPixelColor(indx, ENEO_WHITE);
    if(_use2) _pixels2.setPixelColor(indx, ENEO_WHITE);
    show();
}