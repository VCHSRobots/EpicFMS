// hitdetector.cpp -- Hit Detector -- Single IR Beam Version
// dlb, Oct 2021

// Implements a hit detector using one IR beam.  
// BEWARE -- only one instance of this class is allowed!

// Electronics as follows: a HIGH is returned on the detector pin 
// when the beam is broken or the emitter is off.
// A low is returned on the detector with the BEAM is on and unbroken.

// Detection as follows: The beam status must start in a UNBROKEN state.
// Then the beam must be BROKEN for any lenght in time.

// Note, here are the calculations for how long to expect the IR beam to be broken:
// Assume ball is 1.5" in diameter, and at least 0.25" of the ball will
// interrupt the beam as it passes through the detector.  If the ball is
// flying at 100 feet/sec, then the beam will be interrupted for 0.2ms -- which
// is plenty long enough for the electronics to trigger an interrupt.
// The slowest we expect is a ball rolling at a rate of 1.5 inch/sec and
// interrupting the beam over its entire diameter, which laeds to a beam
// interruption time of 1 second.  Therefore, if the beam is broken longer
// than 1 second, continually, then a hit is declared, but a second hit cannot
// be declared untill a UNBROKEN state is detected again.
//
// If the beam does not clear after 1 second, for at least 25ms, then
// an error condition is declared -- and must be cleared externally.

#include <Arduino.h>
#include "hitdetector.h"

#define BEAM_BROKEN HIGH
#define BEAM_UNBROKEN LOW

static bool s_object_declared = false;
static int s_detector_pin;
static int s_emitter_status = 0;  
static volatile bool s_inerror = false;
static volatile uint32_t s_last_hit_time = millis();
static volatile bool s_ignore_hits = false;
static volatile long s_hitcount = 0;
static volatile uint32_t s_last_pin_change_time = millis();
static volatile int s_pinlevel = BEAM_UNBROKEN;
static volatile long s_isrcnt = 0;

static volatile long s_ac = 0;
static volatile long s_bc = 0;
static volatile long s_cc = 0;
static volatile long s_dc = 0;

// Process Change on IR Beam Pin
IRAM_ATTR void isr_irbeam() {
  s_isrcnt++;
  uint32_t tnow = millis();
  uint32_t elp = s_last_pin_change_time - tnow;
  s_last_pin_change_time = tnow;
  s_pinlevel = digitalRead(uint8_t(s_detector_pin));
  if (s_ignore_hits || s_inerror) {s_dc++; return;}
  if (s_pinlevel == BEAM_BROKEN) {
      // This is a possible hit.
      s_ac++;  
      if (elp < 50ul) { s_bc++; return;}  // Doesn't count, we need at least 50ms of UNBROKEN beam before hit.
      if (tnow - s_last_hit_time < 100) {s_cc++; return;} // No more than 10 balls/second
      s_hitcount++;
      s_last_hit_time = tnow;
  }
}

HitDetector::HitDetector(void) {
    HitDetector(-1, -1); 
}

HitDetector::HitDetector(int emitter_pin, int detector_pin) {
    if (s_object_declared) {
        Serial.println("Unable to create two instances of HitDetector!!!");
        return;
    }
    s_object_declared = true;
    _started = false;
    setpins(emitter_pin, detector_pin);
}

// Sets the pins after construction.  Call before begin().
void HitDetector::setpins(int emitter_pin, int detector_pin) {
    if (_started) {
        Serial.println("Unable to set pins on HitDetector after begin!!!");
        return;
    }
    _emitter_pin = emitter_pin;
    _detector_pin = detector_pin;
    s_detector_pin = detector_pin;
}

// Starts the hit detector.
void HitDetector::begin(void) {
    if(_started) return;
    if (_emitter_pin < 0 || _detector_pin < 0) {
        Serial.println("HitDetector not initailized before begin!!!");
        return;
    }
    s_ignore_hits = true;
    //Serial.println("Setting up IR Hit Detector.");
    delay(10);
    pinMode(uint8_t(_detector_pin), INPUT);
    pinMode(uint8_t(_emitter_pin), OUTPUT);
    digitalWrite(uint8_t(_emitter_pin), HIGH);  // Turn on IR Beam.
    s_emitter_status = 1;
    s_last_pin_change_time = millis() - 20; // 20ms in the past
    s_last_hit_time = millis() - 100; // 100ms in the past
    attachInterrupt(uint8_t(_detector_pin), isr_irbeam, CHANGE);
    delay(2);
    s_ignore_hits = false;
    _started = true;
    _selftest_state = HDSTATUS_INSELFTEST;
    delay(2);
    start_selftest();
}

// Update the status of this object. Should be called once every 100ms or faster.
void HitDetector::update(void) {
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
    pinlevel = s_pinlevel;
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
long HitDetector::value(void) {
    return s_hitcount;
}

// Returns the status of the detector. See the HDSTATUS_xxx defines.
int HitDetector::get_status(void) {
    if (!_started) return HDSTATUS_OFF;
    if (_selftest_state != 0) return HDSTATUS_INSELFTEST;
    if (s_inerror) return HDSTATUS_ERROR;
    return HDSTATUS_OKAY;    
}

const char *HitDetector::get_status_str(void) {
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
int HitDetector::get_fail_code(void) {
    return _selftest_fail_code;
}

// Starts a self test.  The self test will be conducted via update().
// Results of the test can be obtained from get_status() in about 100ms.
// Use this to attempt to clear an error.
void HitDetector::start_selftest(void) {
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
void HitDetector::reset_hits(void) {
    s_hitcount = 0;
}

// Send a status report for debugging to the terminal.
void HitDetector::debug_report(void) {
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
    int x = get_detector();
    sprintf(lineout, "Emitter=%d, Detectors=%d, isr cnts: ac=%ld, bc=%ld, cc=%ld, cd=%ld",
        s_emitter_status, x, s_ac, s_bc, s_cc, s_dc);
    Serial.println(lineout);
}

// Returns the current condition of the detector.
// Useful for debugging hardware.
int HitDetector::get_detector(void) {
    int x = 0;
    if (digitalRead(_detector_pin) == HIGH) x = 1;
    return x;
}

// Sets the emitter output. This is an override that is useful
// for debugging hardware.  This setting will be reset when a 
// selftest is run.
void HitDetector::set_emitter(int x) {
    if (x) { digitalWrite(_emitter_pin, HIGH); s_emitter_status = 1;}
    else   { digitalWrite(_emitter_pin, LOW); s_emitter_status = 0; }
}

// Returns the status of the emitter as a hex number. The LSB
// indicates the status of the emitter.
int HitDetector::get_emitter(void) {
    return s_emitter_status;
}

// Conducts a self test by manipulating the on/off condition of the IR Emitter.
// If an error is found, it is flagged internally, and no hits are allowed.
// This function will also clear the error flag if the test passes. 
// A successfull test takes about 90ms, but no blocking is done.
void HitDetector::conduct_selftest(void) {
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
        case 2:
            //Serial.println("case 2.");
            digitalWrite(uint8_t(_emitter_pin), LOW);
            s_emitter_status = 0;
            _selftest_delay = 2;
            _selftest_state = 3;
            return;
        case 3: 
            //Serial.println("case 3.");
            if (digitalRead(uint8_t(s_detector_pin)) != BEAM_BROKEN) {
                _selftest_delay = 0;
                _selftest_state = 199;
                _selftest_fail_code = 1;
                return;
            }
            digitalWrite(uint8_t(_emitter_pin), HIGH);
            s_emitter_status = 1;
            _selftest_delay = 2;
            _selftest_state = 4;
            return;
        case 4: 
            //Serial.println("case 4.");
            if (digitalRead(uint8_t(s_detector_pin)) != BEAM_UNBROKEN) {
                _selftest_state = 199;
                _selftest_fail_code = 2;
                return;
            }
            _selftest_delay = 25;
            _selftest_state = 5;
            return;
        case 5: 
            //Serial.println("case 5.");
            if (digitalRead(uint8_t(s_detector_pin)) != BEAM_UNBROKEN) {
                _selftest_state = 199;
                _selftest_fail_code = 3;
                return;
            }
            // All is okay
            s_inerror = false;
            digitalWrite(uint8_t(_emitter_pin), HIGH);
            s_emitter_status = 1;
            _selftest_delay = 50;
            _selftest_state = 200;
            _selftest_fail_code = 0;
            return;
        case 199: // Come here to declare error
            //Serial.println("case 199.");
            s_inerror = true; 
            digitalWrite(uint8_t(_emitter_pin), HIGH);
            s_emitter_status = 1;
            _selftest_delay = 50;
            _selftest_state = 200;
            return;
        case 200:
            //Serial.println("case 200.");
            _selftest_state = 0;
            s_ignore_hits = false;
            _selftest_fail_code = 0;
            return;
    }
}

