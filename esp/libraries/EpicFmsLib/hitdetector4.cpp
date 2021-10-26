// hitdetector4.cpp -- Hit Detector -- Four Crossed Beams Version
// dlb, Oct 2021

// Implements a hit detector using four criss-crossing IR beams.  
// BEWARE -- only one instance of this class is allowed!

// Electronics as follows: a HIGH is returned on the detector pin 
// when the beam is broken or the emitter is off.
// A low is returned on the detector with the BEAM is on and unbroken.

// Detection as follows: The beam status must start in a UNBROKEN state.
// Then the beam must be BROKEN for any lenght in time.

// Note, here are the calculations for how long to expect the IR beam to be broken:
// Assume ball is 1.5" in diameter, and at least 0.25" of the ball will
// interrupt one of the beam as it passes through the detector.  If the ball is
// flying at 100 feet/sec, then the beam will be interrupted for 0.2ms -- which
// is plenty long enough for the electronics to trigger an interrupt.
// The slowest we expect is a ball rolling at a rate of 1.5 inch/sec and
// interrupting any beam over its entire diameter, which laeds to a 
// combined beam interruption time of 1 second.  Therefore, if the beams are
// broken longer than 1 second, continually, then a hit is declared, but a
// second hit cannot be declared untill a UNBROKEN state is detected again.
//
// If the beam does not clear after 1 second, for at least 25ms, then
// an error condition is declared -- and must be cleared by initiating a 
// successful self-test.
//
// For detection, all beams are logically "combined" in series to make
// one beam.  Therefore, if any beam is broken, the entire set of beams
// is considered broken, and all beams must be unbroken for the set to 
// be considered unbroken.

#include <Arduino.h>
#include "hitdetector4.h"

#define BEAM_BROKEN HIGH
#define BEAM_UNBROKEN LOW

bool s_object_declared = false;
int s_emitter_pins[4]; // The four emitter pins
int s_detector_pins[4]; // The four detector pins
int s_emitter_indexes[4]; // Index of emitter that matches detector
volatile long s_hitcount = 0; // count of valid hits detected
volatile bool s_inerror = false;
volatile uint32_t s_last_hit_time = millis();
volatile bool s_ignore_hits = false;
volatile uint32_t s_last_pin_change_time = millis();
volatile int s_beam = BEAM_UNBROKEN; // Last condition of beam as read in isr
volatile long s_isrcnt = 0; // counts calls to isr to verifiy it's working

// Used for debugging
volatile long s_ac = 0; // Records candidate hits
volatile long s_bc = 0; // Number candidates rejected due to UNBROKEN beam beforehand
volatile long s_cc = 0; // Number candidates rejected due to hits too fast
volatile long s_dc = 0; // Number of changes rejected due to ignore or error

// Treats all four beams as one, and returns weither or not
// the beam is broken.
int read_4beam_status() {
  for(int i = 0; i < 4; i++) {
      if(digitalRead(s_detector_pins[i]) == BEAM_BROKEN) return BEAM_BROKEN;
  }
  return BEAM_UNBROKEN;
}

// Process Change on IR Beam Pin
IRAM_ATTR void isr_irbeam4() {
  s_isrcnt++;
  uint32_t tnow = millis();
  uint32_t elp = s_last_pin_change_time - tnow;
  s_last_pin_change_time = tnow;
  s_beam = read_4beam_status();
  if (s_ignore_hits || s_inerror) {s_dc++; return;}
  if (s_beam == BEAM_BROKEN) {
      // This is a possible hit.
      s_ac++;  
      if (elp < 50ul) { s_bc++; return;}  // Doesn't count, we need at least 50ms of UNBROKEN beam before hit.
      if (tnow - s_last_hit_time < 100) {s_cc++; return;} // No more than 10 balls/second
      s_hitcount++;
      s_last_hit_time = tnow;
  }
}

HitDetector4::HitDetector4(void) {
    HitDetector4(-1, -1, -1, -1, -1, -1, -1, -1); 
}

HitDetector4::HitDetector4(int pin_e1, int pin_e2, int pin_e3, int pin_e4,
        int pin_d1, int pin_d2, int pin_d3, int pin_d4) {
    if (s_object_declared) {
        Serial.println("Unable to create two instances of HitDetector4!!!");
        return;
    }
    s_object_declared = true;
    _started = false;
    setpins(pin_e1, pin_e2, pin_e3, pin_e4, pin_d1, pin_d2, pin_d3, pin_d4);
}

// Sets the pin numbers. Must be called before begin().
void HitDetector4::setpins(int pin_e1, int pin_e2, int pin_e3, int pin_e4,
        int pin_d1, int pin_d2, int pin_d3, int pin_d4) {
    if (_started) {
        Serial.println("Unable to set pins on HitDetector after begin!!!");
        return;
    }
    s_emitter_pins[0]  = pin_e1;
    s_emitter_pins[1]  = pin_e2;
    s_emitter_pins[2]  = pin_e3;
    s_emitter_pins[3]  = pin_e4;
    s_detector_pins[0] = pin_d1;
    s_detector_pins[1] = pin_d2;
    s_detector_pins[2] = pin_d3;
    s_detector_pins[3] = pin_d4;
}

// Starts the hit detector.
void HitDetector4::begin(void) {
    if(_started) return;
    bool pins_inited = true;
    for(int i = 0; i < 4; i++) {
        if (s_emitter_pins[i] < 0 || s_detector_pins[i] < 0) pins_inited = false;
    }
    if (!pins_inited) {
        Serial.println("HitDetector4 not initailized before begin!!!");
        return;
    }
    s_ignore_hits = true;
    //Serial.println("Setting up IR Hit Detector.");
    delay(10);
    for(int i = 0; i < 4; i++) {
        uint8 dpin = s_detector_pins[i];
        uint8 epin = s_emitter_pins[i];
        pinMode(dpin, INPUT);
        pinMode(epin, OUTPUT);
        digitalWrite(epin, HIGH);  // Turn on IR Beam.
        attachInterrupt(dpin, isr_irbeam4, CHANGE);
    }
    s_last_pin_change_time = millis() - 20; // 20ms in the past
    s_last_hit_time = millis() - 100; // 100ms in the past
    _started = true;
    _selftest_state = HDSTATUS_INSELFTEST;
    delay(2);
    start_selftest();
}

// Update the status of this object. Should be called once every 100ms or faster.
void HitDetector4::update(void) {
    int pinlevel;
    uint32_t pinchangetime;

    // if begin has not been called, don't do anything.
    if(!_started) return;

    // If conducting a self test, do that only.
    if(_selftest_state != 0) {
        conduct_selftest();
        return;
    }

    // If we are in an error condition, then nothing left to do.
    if (s_inerror) return;

    // Check to see if we are having problems.
    noInterrupts();
    pinlevel = s_beam;
    pinchangetime = s_last_pin_change_time;
    interrupts();

    if(pinlevel == BEAM_BROKEN) {
        if (millis() - pinchangetime > 1500) {
            Serial.println("Error due 1.5 seconds of broken beam.");
            // Something is wrong -- beam broken too long.  Declare error.
            s_inerror = true;
            _selftest_fail_code = 10;
        }
    }
}

// Returns the hit count.
long HitDetector4::value(void) {
    return s_hitcount;
}

// Returns the status of the detector. See the HDSTATUS_xxx defines.
int HitDetector4::get_status(void) {
    char lineout[100];
    if (!_started) return HDSTATUS_OFF;
    if (_selftest_state != 0) return HDSTATUS_INSELFTEST;
    if (s_inerror) return HDSTATUS_ERROR;
    return HDSTATUS_OKAY;    
}

const char *HitDetector4::get_status_str(void) {
    int x = get_status();
    switch(x) {
        case HDSTATUS_OFF: return "off";
        case HDSTATUS_OKAY: return "okay";
        case HDSTATUS_INSELFTEST: return "testing";
        case HDSTATUS_ERROR: return "error";
        default: return "??";
    }
}

// Returns fail err code, if any. See code below to 
// interperate what it means.
int HitDetector4::get_fail_code(void) {
    return _selftest_fail_code;
}

// Starts a self test.  The self test will be conducted via update().
// Results of the test can be obtained from get_status() in about 100ms.
// Use this to attempt to clear an error.
void HitDetector4::start_selftest(void) {
    if (!_started) {
        Serial.println("Selftest cannot run before begin in HitDetector!!!");
        return;
    }    
    if (_selftest_state != 0) return;
    _selftest_state = 1;
    _selftest_delay_t0 = millis();
    _selftest_delay = 0;
}

// Resets the hit count to zero.
void HitDetector4::reset_hits(void) {
    s_hitcount = 0;
}

// Send a status report for debugging to the terminal.
void HitDetector4::debug_report(void) {
    char lineout[100];
    const char *state;
    switch(get_status()) {
        case HDSTATUS_OFF: state = "Off"; break;
        case HDSTATUS_OKAY: state = "Okay"; break;
        case HDSTATUS_INSELFTEST: state = "Testing"; break;
        case HDSTATUS_ERROR: state = "Error"; break;
        default: state="Unknown"; break;
    }
    sprintf(lineout, "Hit Count=%ld, IR Det Status = %s, inerr=%d, isrcnt=%ld", s_hitcount, state, s_inerror, s_isrcnt);
    Serial.println(lineout);
    sprintf(lineout, "Hit isr cnts: ac=%ld, bc=%ld, cc=%ld, cd=%ld", s_ac, s_bc, s_cc, s_dc);
    Serial.println(lineout);
}

// Conducts a self test by manipulating the on/off condition of the IR Emitter.
// If an error is found, it is flagged internally, and no hits are allowed.
// This function will also clear the error flag if the test passes. 
// No blocking is done, however this function must be called repeatedly to 
// conduct the test.  Should be done in under 50ms.
void HitDetector4::conduct_selftest(void) {
    // Here we implment a delay
    uint32_t tnow = millis();
    if(tnow - _selftest_delay_t0 < _selftest_delay) return;

    _selftest_delay_t0 = tnow;
    _selftest_delay = 0;  // Assume zero, can be overwriten
    switch(_selftest_state) {
        case 1: // Start up here.
            //Serial.println("case 1.");
            s_ignore_hits = true;  // Ignore counts in the isr, as to not count fake hits.
            _selftest_delay = 10;
            _selftest_state = 2;
            return;
        case 2: // Turn off all emitters, set up the index
            //Serial.println("case 2.");
            for (int i=0; i < 4; i++) digitalWrite(s_emitter_pins[i], LOW);
            for (int i=0; i < 4; i++) s_emitter_indexes[i] = -1;
            _selftest_delay = 2;
            _selftest_state = 3;
            _selftest_emitter_num = 0;
            return;
        case 3: // Turn one emitter on.
            //Serial.println("case 3.");
            digitalWrite(s_emitter_pins[_selftest_emitter_num], HIGH);
            _selftest_delay = 2;
            _selftest_state = 4;
            return;
        case 4: // Search for detector 
            { 
                int dp = -1;
                for (int i = 0; i < 4; i++) {
                    if (digitalRead(s_detector_pins[i]) == BEAM_UNBROKEN) {
                        if (dp != -1) {
                            // Two detectors for one emitter! error.
                            _selftest_delay = 2;
                            _selftest_state = 99;
                            _selftest_fail_code = 1;
                            return;
                        }
                        dp = i;
                    }
                }
                if (dp == -1) {
                    // No detector found for emitter! error.
                    {
                        char lineout[100];
                        sprintf(lineout, "Fail found: emitter_num=%d", _selftest_emitter_num);
                        Serial.println(lineout);
                    }
                    _selftest_delay = 2;
                    _selftest_state = 99;
                    _selftest_fail_code = 2;
                    return;
                }
                for (int i = 0; i < 4; i++) digitalWrite(s_emitter_pins[i], LOW);
                s_emitter_indexes[_selftest_emitter_num] = dp;
                _selftest_emitter_num++;
                if (_selftest_emitter_num >= 4) {
                    _selftest_delay = 2;
                    _selftest_state = 10;
                    return;
                }
                _selftest_delay = 2;
                _selftest_state = 3;
                return;
            }
        case 10: // Check all detectors found.
            {
                int found[4] = {-1, -1, -1, -1};
                for(int i = 0; i < 4; i++) {
                    int indx = s_emitter_indexes[i];
                    if (indx >= 0 && indx <= 3) found[indx] = 1;
                }
                for (int i= 0; i < 4; i++) {
                    if (found[i] == -1) {
                        // Not all detectors matched with an emitter. Error.
                        _selftest_delay = 2;
                        _selftest_state = 99;
                        _selftest_fail_code = 3;
                        return;
                    }
                }
                _selftest_emitter_num = 0;
                _selftest_state = 11;
                _selftest_delay = 2;
                return;
            }
        case 11: // Check emitter/detetor pair, one at a time
            digitalWrite(s_emitter_pins[_selftest_emitter_num], HIGH);
            _selftest_state = 12;
            _selftest_delay = 2;
            return;
        case 12: 
            {
                int indx = s_emitter_indexes[_selftest_emitter_num];
                if (digitalRead(s_detector_pins[indx]) == BEAM_BROKEN) {
                    // Beam should have been unbroken. Error.
                    _selftest_delay = 2;
                    _selftest_state = 99;
                    _selftest_fail_code = 4;
                    return;
                }
                _selftest_emitter_num++;
                if (_selftest_emitter_num >= 4) {
                    _selftest_delay = 2;
                    _selftest_state = 100;
                    return;
                }
                for (int i = 0; i < 4; i++) digitalWrite(s_emitter_pins[i], LOW);
                _selftest_delay = 2;
                _selftest_state = 11;
                return;
            }
        case 99: // Declare error
            for(int i = 0; i < 4; i++) digitalWrite(s_emitter_pins[i], HIGH);
            { 
                char lineout[100];
                sprintf(lineout, "Finished Self Test, declaring error!  code=%d", _selftest_fail_code);
                Serial.println(lineout);
            }
            s_inerror = true;
            _selftest_state = 0; 
            s_ignore_hits = true;
            return;
        case 100: // Declare okay
            for(int i = 0; i < 4; i++) digitalWrite(s_emitter_pins[i], HIGH);
            Serial.println("Finished Self Test, All okay!");
            s_inerror = false;
            _selftest_state = 0; 
            s_ignore_hits = false;
            _selftest_fail_code = 0;
            return;
    }
}
