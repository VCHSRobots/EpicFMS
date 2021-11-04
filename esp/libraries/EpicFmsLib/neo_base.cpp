// neo_base.cpp -- base class for mananging dual neo strips
// dlb, Oct 2021

// This class was invented so that code could be shared between target
// types, and therefore keeping the overall look of the game the same
// across the targets, while at the same time allowing different 
// target types a way to show slightly different patterns do to 
// their partularities. 
//
// The way this works is:  this class should be "inherited" by a 
// sub class -- a differenent sub class for each target type.
// The sub class should "override" the function "smash()." Smash
// should change the pattern on the neo strips to suit the target 
// type.
//
// The main program loop should call update() as often as possible,
// say at least once every 20ms. Update() calucates the time
// delay, and calls smash whenever the currently requested delay
// is exceeded.  Smash() is then responsible for completing the
// pattern on the strip (but NOT to show it).
//
// Update() calls smash() for the followning reasons:
//  1. The gamemode has changed
//  2. The currently requested delay has been exceeded.
//
// Whenever smash() is called, the strips have been preloaded
// with the pattern for the current mode.  All smash needs
// to do is to override the pattern if called for up the 
// target's condition. Once smash() returns, the staged pattern
// will imediately be shown by update().  (Smash() should not
// call show()!).

#include "neo_base.h"

NeoBase::NeoBase(int neopin1, int neopin2, int npixels1, int npixels2) {
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
        _pixels1.updateType(NEO_GRB + NEO_KHZ800);
    }
    if (_use2) {
        _pixels2.updateLength(_np);
        _pixels2.setPin(uint16(_neopin1));
        _pixels2.updateType(NEO_GRB + NEO_KHZ800);
    }
    _lastupdatetime = millis();
}

void NeoBase::begin(void) {
    Serial.println("In NeoBase::begin...");
    delay(100);
    char lineout[100];
    sprintf(lineout, "Strip1: %d, Strip2: %d", _use1, _use2);
    Serial.println(lineout);
    delay(50);
    if (_use1) _pixels1.begin();
    if (_use2) _pixels2.begin();
    Serial.println("Returning from begin...");
    delay(50);
    _lastupdatetime = millis();
    _gamemode = -1;  // Should cause the first update.
}

// Update should be called at least every 20ms.  Update() decides if
// it is time to update the pixels.  If so, the pixels are prestaged
// with the pattern for the given gamemode, and then smash() is 
// called to provide overrides.  Finally, show() is called to 
// display the new pattern.
void NeoBase::update(int gamemode) {
    uint32_t tnow = millis();
    uint32_t telp = tnow - _lastupdatetime; 
    if (telp < _delay_time && gamemode == _gamemode) return;
    _lastupdatetime = tnow;
    bool is_changed = (gamemode == _gamemode);
    _gamemode = gamemode;
    stage_online(gamemode, is_changed, telp);
    smash(gamemode, is_changed, telp);
    show();
}

// This is a "do-nothing" smash() function.  Subclasses should
// overwrite this class.
void NeoBase::smash(int gamemode, bool changed, uint32_t telp) {
    return;
}

// Shows the contents of a staged strip.  
void NeoBase::show(void) {
    if (_use1) _pixels1.show();
    if (_use2) _pixels2.show();
}

// Sets the color of a single pixel -- staged.
void NeoBase::set_pixel_color(int indx, uint32_t c) {
    if (indx < 0 || indx >= _np) return;
    if(_use1) _pixels1.setPixelColor(indx, c);
    if(_use2) _pixels2.setPixelColor(indx, c);
}

// Sets the color of a single pixel -- staged.
void NeoBase::set_pixel_color(int indx, int r, int g, int b) {
    if (indx < 0 || indx >= _np) return;
    if(_use1) _pixels1.setPixelColor(indx, r, g, b);
    if(_use2) _pixels2.setPixelColor(indx, r, g, b);
}

// Stage a solid color over the entire strip
void NeoBase::stage_solidcolor(int r, int g, int b) {
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r, g, b));
    }
}

// Stage a solid color over the entire strip
void NeoBase::stage_solidcolor(uint32_t c) {
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, c);
        if(_use2) _pixels2.setPixelColor(i, c);
    }
}

// Stages a counting sequence.  The parameter n is the number
// of LED to light.
void NeoBase::stage_count(int n, int r, int g, int b) {
    if (n > _np) n = _np;
    stage_solidcolor(0, 0, 0);
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(i, _pixels2.Color(r, g, b)); 
    }
}

// Stages a counting sequence.  The parameter n is the number
// of LED to light.
void NeoBase::stage_count(int n, uint32_t c) {
    if (n > _np) n = _np;
    stage_solidcolor(ENEO_BLACK);
    for(int i = 0; i < _np; i++) {
        if(_use1) _pixels1.setPixelColor(i, c);
        if(_use2) _pixels2.setPixelColor(i, c); 
    }
}

// Stages one Pixel, and turns all the others off.
void NeoBase::stage_one(int n, int r, int g, int b) {
    stage_solidcolor(ENEO_BLACK);
    if (n < _np) {
        if(_use1) _pixels1.setPixelColor(n, _pixels1.Color(r, g, b));
        if(_use2) _pixels2.setPixelColor(n, _pixels2.Color(r, g, b)); 
    }
}
// Stages one Pixel, and turns all the others off.
void NeoBase::stage_one(int n, uint32_t c) {
    stage_solidcolor(ENEO_BLACK);
    if (n < _np) {
        if(_use1) _pixels1.setPixelColor(n, c);
        if(_use2) _pixels2.setPixelColor(n, c); 
    }
}

// Stages alternating sets of pixels, both of sets with the same size.
void NeoBase::stage_groups(int nsize, uint32_t c1, uint32_t c2) {
    stage_groups_asymmetric(nsize, nsize, c1, c2);
}

// Stages alternating sets of pixels, both of different sizes.
void NeoBase::stage_groups_asymmetric(int nsize1, int nsize2, uint32_t c1, uint32_t c2) {
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

// Stages the general game-mode pattern over all the pixels
void NeoBase::stage_online(int game_mode, bool new_mode, uint32_t telp) {
    static int last_side = 0;
    static int update_count = 0;
    switch(game_mode) {
        case GMODE_NONE:     // Horriable Programming Error:  red/yellow @ fast
            if (last_side == 1) {
                stage_groups(2, ENEO_RED_DIM, ENEO_YELLOW);
                last_side = 0;
            } else {
                stage_groups(2, ENEO_YELLOW, ENEO_RED_DIM);
                last_side = 1;  
            }
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
            _delay_time = 50;
            return;
        case GMODE_PWRUP: // Fast Running red
             if (last_side>_np) { last_side=0; return;}
             stage_one(last_side, 200, 0, 0);
             _delay_time = 30;
             last_side++;
            return;
        case GMODE_UNITERR: // Super Fast running red
             if (last_side>_np) { last_side=0; return;}
             stage_one(last_side, 255, 0, 0);
             _delay_time = 10;
             last_side++;
             return;
        case GMODE_PRACTICE: // Breathing blue
            if (last_side> 200) { last_side=0; return;}
             stage_solidcolor(0, 0, last_side);
             _delay_time = 10;
             last_side++;
             return;
        case GMODE_TELEOP: // Breathing blue
            //if (last_side > 100) { last_side= 50; return;}
             //stage_solidcolor(last_side - 50, 0, last_side);
             stage_solidcolor(0, 0, 129);
             _delay_time = 200;
             //last_side++;
             return;
        case GMODE_MATCHCOUNTDOWN: //red, yellow, blue, green
            _delay_time = 1000;
            if (update_count != 377) { last_side = 1; update_count = 377;}
                if (last_side == 1){
                    stage_solidcolor(ENEO_RED);
                    last_side++;
                    return;
                }
                if (last_side == 2){
                    stage_solidcolor(ENEO_YELLOW);
                    last_side++;
                    return;
                }
                if (last_side == 3){
                    stage_solidcolor(ENEO_BLUE);
                    last_side++;
                    return;
                }
                if (last_side >= 4 & last_side <=6){
                    stage_solidcolor(ENEO_GREEN);
                    last_side++;
                    return;
                }
                if (last_side == 7){ last_side = 1;} //To cycle the program
            return;
        case GMODE_AUTO: //Dim White Running
             if (last_side>_np) { last_side=0; return;}
             stage_one(last_side, ENEO_WHITE_DIM);
             _delay_time = 30;
             last_side++;
            return;
        case GMODE_MATCHFINAL: //END of match (for the last 30 secs of the match)
            if (last_side == 1) { last_side = 0; stage_solidcolor(ENEO_BLACK); _delay_time= 500; return;}
            stage_solidcolor( 0, 0, 200);
            last_side =1;
            _delay_time = 500;
            return;
        case GMODE_POSTWAIT: //yellow slow chasing
            if (last_side > _np) { last_side=0; return;}
             stage_one(last_side, ENEO_YELLOW_DIM);
             _delay_time = 100;
             last_side++;
             return;
        case GMODE_POSTRESULT: // random flashing
            if (last_side > _np) { last_side=0; return;}
             stage_one(last_side, random(0,255),random(0,255),random(0,255));
             _delay_time = 25;
             last_side++;
             return;
        case GMODE_BLINK: // Blink to indicate unit, red-green-blue on/off
             last_side++;
             if(last_side >= 2) last_side = 0;
              _delay_time = 75;
             if (last_side == 0) {
                 for (int i = 0; i < _np; i++) {
                     int ii = (i / 3) % 3;
                     int c = ENEO_RED;
                     if (ii == 1) c = ENEO_BLUE;
                     if (ii == 2) c = ENEO_GREEN;
                     set_pixel_color(i, c);
                 }
                 return;
             } else {
                 stage_solidcolor(ENEO_BLACK);
                 return;
             }

        default: // All other modes for now... pink/yellow blink
            last_side++;
            if (last_side == 1) {
                stage_solidcolor(ENEO_PINK);
                last_side = 0;
            } else {
                stage_solidcolor(ENEO_YELLOW);
                last_side = 1;
            }
            _delay_time = 100;
            return;
    }
}