// neo_conductor.cpp -- A class to manage two strips of Neo Pixels
// for the EpicFMS devices
// dlb, Oct 2021
//

#include "neo_conductor.h"
#include "EpicFmsLib.h"

// Constructor. Set pins to -1 and/or npixels to 0 to disable a strip.  
NeoConductor::NeoConductor(int neopin1, int neopin2, int npixels1, int npixels2) {
    _neopin1 = neopin1;
    _neopin2 = neopin2;
    _npixels1 = npixels1;
    _npixels2 = npixels2;
    _np = _npixels1;
    if(_npixels2 > _np) _np = _npixels2;
    _use1 = (_neopin1 > -1) && (_npixels1 > 0);
    _use2 = (_neopin2 > -1) && (_npixels2 > 0);
    if (_use1) {
        _pixels1.updateLength(_np);
        _pixels1.setPin(_neopin1);
        _pixels1.updateType(NEO_RGB + NEO_KHZ800);
    }
    if (_use2) {
        _pixels2.updateLength(_np);
        _pixels2.setPin(_neopin1);
        _pixels2.updateType(NEO_RGB + NEO_KHZ800);
    }
    _lastupdatetime = millis();
}

void NeoConductor::begin(void) {
    Serial.println("In neo begin...");
    delay(1000);
    char lineout[100];
    sprintf(lineout, "Strip1: %d, Strip2: %d", _use1, _use2);
    Serial.println(lineout);
    delay(50);
    if (_use1) _pixels1.begin();
    if (_use2) _pixels2.begin();
    Serial.println("Returning from neo begin...");
    delay(50);
}

void NeoConductor::setmode(int mode) {
    if (mode == _mode) return; // Not a new mode
    _mode = mode;
    // TODO: do what requries to start a new mode here
    update();
}

void NeoConductor::update(void) {
    if (millis() - _lastupdatetime < 50) return;
    _lastupdatetime = millis();
    // TODO: do something on a strip according to current mode.

}

void NeoConductor::hitflash(void) {

}

void NeoConductor::show(void) {
    if (_use1) _pixels1.show();
    if (_use2) _pixels2.show();
}

void NeoConductor::stage_solidcolor(int r, int g, int b) {
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r, g, b));
    }
}

void NeoConductor::stage_groups(int nsize, int r1, int g1, int b1, int r2, int b2, int g2) {
    int i = 0; 
    int igp = 0;
    while(true) {
        for(int j = 0; j < nsize; j++) {
            if (i >= _np) break;
            if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r1, g1, b1));
            if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r1, g1, b1));
            i++;
        }
        for(int j = 0; j < nsize; j++) {
            if (i >= _np) break;
            if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r2, g2, b2));
            if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r2, g2, b2));
            i++;
        }
        if (i >= _np) break;
    }
}

void NeoConductor::show_solidcolor(int r, int g, int b) {
    stage_solidcolor(r, g, b);
    show();
}

void NeoConductor::show_count(int n, int r, int g, int b) {
    if (n > _np) n = _np;
    stage_solidcolor(0, 0, 0);
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r, g, b)); 
    }
    show();
}

void NeoConductor::show_one(int n, int r, int g, int b) {
    stage_solidcolor(0, 0, 0);
    if (n < _np) {
        if(_use1) _pixels1.setPixelColor(n, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(n, _pixels2.Color(r, g, b)); 
    }
    show();
}

// Shows the basket status for practice and debut mode on the basket.
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
    static unsigned long last_time = -1;
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
    unsigned long tnow = millis();
    unsigned long elp = tnow - last_time;
    if(jerking) {
        if (elp < 100) return;
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
        if (elp < 100) return;
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
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(0, 255, 0));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(0, 255, 0)); 
    }
    for(int i = 0; i < njamshow; i++) {
        if(_use1) _pixels1.setPixelColor(_np - 1 - i, _pixels1.Color(128, 0, 65));
        if(_use2) _pixels2.setPixelColor(_np - 1 - i, _pixels2.Color(128, 0, 65));    
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