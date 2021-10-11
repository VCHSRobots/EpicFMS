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

void NeoConductor::stage_solidcolor(int r, int g, int b) {
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r, g, b));
    }
}

void NeoConductor::show_solidcolor(int r, int g, int b) {
    stage_solidcolor(r, g, b);
    if (_use1) _pixels1.show();
    if (_use2) _pixels2.show();
}

void NeoConductor::show_count(int n, int r, int g, int b) {
    if (n > _np) n = _np;
    stage_solidcolor(0, 0, 0);
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r, g, b)); 
    }
    if (_use1) _pixels1.show();
    if (_use2) _pixels2.show();
}

void NeoConductor::show_one(int n, int r, int g, int b) {
    stage_solidcolor(0, 0, 0);
    if (n < _np) {
        if(_use1) _pixels1.setPixelColor(n, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(n, _pixels2.Color(r, g, b)); 
    }
    if (_use1) _pixels1.show();
    if (_use2) _pixels2.show();
}