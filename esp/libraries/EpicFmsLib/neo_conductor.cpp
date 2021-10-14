// neo_conductor.cpp -- A class to manage two strips of Neo Pixels
// for the EpicFMS devices
// dlb, Oct 2021
// Johnathan, Oct/12/2021-- Merged Code

// Note: for the white Neo Pixel strips the red/green/blue order is mixed up.
// IT is actually green/red/blue.  This code rearranges the inputs to make things right.

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
        _pixels1.setPin(uint16(_neopin1));
        _pixels1.updateType(NEO_RGB + NEO_KHZ800);
    }
    if (_use2) {
        _pixels2.updateLength(_np);
        _pixels2.setPin(uint16(_neopin1));
        _pixels2.updateType(NEO_RGB + NEO_KHZ800);
    }
    _lastupdatetime = millis();
}

void NeoConductor::begin(void) {
    Serial.println("In neo begin...");
    delay(100);
    char lineout[100];
    sprintf(lineout, "Strip1: %d, Strip2: %d", _use1, _use2);
    Serial.println(lineout);
    delay(50);
    if (_use1) _pixels1.begin();
    if (_use2) _pixels2.begin();
    Serial.println("Returning from neo begin...");
    delay(50);
}

void NeoConductor::update(void) {
    if (millis() - _lastupdatetime < 50) return;
    _lastupdatetime = millis();
    // TODO: do something on a strip according to current mode.
}

void NeoConductor::setmode(int mode) {
    if (mode == _mode) return; // Not a new mode
    _mode = mode;
    // TODO: do what requries to start a new mode here
    update();
}

// Call this when a hit is detected for a quick flash.
void NeoConductor::hitflash(void) {
    // TODO.
}

// Call for debug report to the terminal. 
void NeoConductor::debug_report(void) {
    // Nothing to report.
}

// Sets the color of a single pixel -- staged.
void NeoConductor::set_pixel_color(int i, uint32_t c) {
    if (i < 0 || i >= _np) return;
    if(_use1) _pixels1.setPixelColor(i, c);
    if(_use2) _pixels2.setPixelColor(i, c);
}

void NeoConductor::show(void) {
    if (_use1) _pixels1.show();
    if (_use2) _pixels2.show();
}

// Stage a solid color over the entire strip
void NeoConductor::stage_solidcolor(int r, int g, int b) {
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(g, r, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(g, r, b));
    }
}

void NeoConductor::stage_solidcolor(uint32_t c) {
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, c);
        if(_use2) _pixels2.setPixelColor(i, c);
    }
}

void NeoConductor::show_solidcolor(int r, int g, int b) {
    stage_solidcolor(r, g, b);
    show();
}

void NeoConductor::show_solidcolor(uint32_t c) {
    stage_solidcolor(c);
    show();
}

void NeoConductor::show_count(int n, int r, int g, int b) {
    if (n > _np) n = _np;
    stage_solidcolor(0, 0, 0);
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(g, r, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(g, r, b)); 
    }
    show();
}

void NeoConductor::show_count(int n, uint32_t c) {
    if (n > _np) n = _np;
    stage_solidcolor(ENEO_BLACK);
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, c);
        if(_use2) _pixels2.setPixelColor(i, c); 
    }
    show();
}

void NeoConductor::show_one(int n, int r, int g, int b) {
    stage_solidcolor(ENEO_BLACK);
    if (n < _np) {
        if(_use1) _pixels1.setPixelColor(n, _pixels1.Color(g, r, b));
        if(_use2) _pixels2.setPixelColor(n, _pixels2.Color(g, r, b)); 
    }
    show();
}

void NeoConductor::show_one(int n, uint32_t c) {
    stage_solidcolor(ENEO_BLACK);
    if (n < _np) {
        if(_use1) _pixels1.setPixelColor(n, c);
        if(_use2) _pixels2.setPixelColor(n, c); 
    }
    show();
}

void NeoConductor::stage_groups(int nsize, uint32_t c1, uint32_t c2) {
    stage_groups_asymmetric(nsize, nsize, c1, c2);
}

void NeoConductor::stage_groups_asymmetric(int nsize1, int nsize2, uint32_t c1, uint32_t c2) {
    int i = 0; 
    while(true) {
        for(int j = 0; j < nsize1; j++) {
            if (i >= _np) break;
            if(_use1) _pixels1.setPixelColor(i, c1);
            if(_use2) _pixels2.setPixelColor(i, c2);
            i++;
        }
        for(int j = 0; j < nsize2; j++) {
            if (i >= _np) break;
            if(_use1) _pixels1.setPixelColor(i, c2);
            if(_use2) _pixels2.setPixelColor(i, c1);
            i++;
        }
        if (i >= _np) break;
    }
}





