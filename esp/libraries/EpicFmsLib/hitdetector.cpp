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

int g_detector_pin;
bool g_hit_declared = false;
volatile bool g_inerror = false;
volatile unsigned long g_last_hit_time = millis();
volatile bool g_ignore_hits = false;
volatile long g_hitcount = 0;
volatile unsigned long g_last_pin_change_time = millis();
volatile int g_pinlevel = BEAM_UNBROKEN;
volatile long g_isrcnt = 0;

volatile long ac = 0;
volatile long bc = 0;
volatile long cc = 0;
volatile long dc = 0;

// Process Change on IR Beam Pin
ICACHE_RAM_ATTR void isr_irbeam() {
  g_isrcnt++;
  unsigned long tnow = millis();
  unsigned long elp = g_last_pin_change_time - tnow;
  g_last_pin_change_time = tnow;
  g_pinlevel = digitalRead(g_detector_pin);
  if (g_ignore_hits || g_inerror) {dc++; return;}
  if (g_pinlevel == BEAM_BROKEN) {
      // This is a possible hit.
      ac++;  
      if (elp < 50ul) { bc++; return;}  // Doesn't count, we need at least 50ms of UNBROKEN beam before hit.
      if (tnow - g_last_hit_time < 100) {cc++; return;} // No more than 10 balls/second
      g_hitcount++;
      g_last_hit_time = tnow;
  }
}

HitDetector::HitDetector(void) {
    HitDetector(-1, -1); 
}

HitDetector::HitDetector(int emitter_pin, int detector_pin) {
    if (g_hit_declared) {
        Serial.println("Unable to create two instances of HitDetector!!!");
        return;
    }
    g_hit_declared = true;
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
    g_detector_pin = detector_pin;
}

// Starts the hit detector.
void HitDetector::begin(void) {
    if (_emitter_pin < 0 || _detector_pin < 0) {
        Serial.println("HitDetector not initailized before begin!!!");
        return;
    }
    if(_started) return;
    //Serial.println("Setting up IR Hit Detector.");
    delay(10);
    pinMode(_detector_pin, INPUT);
    pinMode(_emitter_pin, OUTPUT);
    digitalWrite(_emitter_pin, HIGH);  // Turn on IR Beam.
    g_last_pin_change_time = millis() - 20; // 20ms in the past
    g_last_hit_time = millis() - 100; // 100ms in the past
    g_ignore_hits = true;
    attachInterrupt(_detector_pin, isr_irbeam, CHANGE);
    delay(2);
    g_ignore_hits = false;
    _started = true;
    _selftest_state = 0;
    start_selftest();
}

// Update the status of this object. Should be called once every 100ms or faster.
void HitDetector::update(void) {
    int pinlevel;
    unsigned long pinchangetime;

    // if begin has not been called, don't do anything.
    if(!_started) return;

    // If conducting a self test, do that only.
    if(_selftest_state != 0) {
        conduct_selftest();
        return;
    }

    // If we are in an error condition, then nothing left to do.
    if (g_inerror) return;

    // Check to see if we are having problems.
    noInterrupts();
    pinlevel = g_pinlevel;
    pinchangetime = g_last_pin_change_time;
    interrupts();

    if(pinlevel == BEAM_BROKEN) {
        if (millis() - pinchangetime > 1500) {
            Serial.println("Error due 1.5 seconds of broken beam.");
            // Something is wrong -- beam broken too long.  Declare error.
            g_inerror = true;
        }
    }
}

// Returns the hit count.
long HitDetector::value(void) {
    return g_hitcount;
}

// Returns the status of the detector. See the HDSTATUS_xxx defines.
int HitDetector::get_status(void) {
    if (!_started) return HDSTATUS_OFF;
    if (_selftest_state != 0) return HDSTATUS_INSELFTEST;
    if (g_inerror) return HDSTATUS_ERROR;
    return HDSTATUS_OKAY;    
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

// Send a status report for debugging to the terminal.
void HitDetector::debug_report(void) {
    char lineout[100];
    char *state;
    switch(get_status()) {
        case HDSTATUS_OFF: state = "Off"; break;
        case HDSTATUS_OKAY: state = "Okay"; break;
        case HDSTATUS_INSELFTEST: state = "Testing"; break;
        case HDSTATUS_ERROR: state = "Error"; break;
        default: state="Unknown"; break;
    }
    sprintf(lineout, "Hit Count=%ld, IR Det Status = %s, inerr=%d, isrcnt=%ld", g_hitcount, state, g_inerror, g_isrcnt);
    Serial.println(lineout);
    sprintf(lineout, "isr cnts: ac=%ld, bc=%ld, cc=%ld, cd=%ld", ac, bc, cc, dc);
    Serial.println(lineout);
}

// Conducts a self test by manipulating the on/off condition of the IR Emitter.
// If an error is found, it is flagged internally, and no hits are allowed.
// This function will also clear the error flag if the test passes. 
// A successfull test takes about 90ms, but no blocking is done.
void HitDetector::conduct_selftest(void) {
    // Here we implment a delay
    unsigned long tnow = millis();
    if(tnow - _selftest_delay_t0 < _selftest_delay) return;

    _selftest_delay_t0 = tnow;
    _selftest_delay = 0;  // Assume zero, can be overwriten
    switch(_selftest_state) {
        case 1: // Start up here.
            Serial.println("case 1.");
            g_ignore_hits = true;  // Ignore counts in the isr, as to not count fake hits.
            _selftest_delay = 10;
            _selftest_state = 2;
            return;
        case 2:
            Serial.println("case 2.");
            digitalWrite(_emitter_pin, LOW);
            _selftest_delay = 2;
            _selftest_state = 3;
            return;
        case 3: 
            Serial.println("case 3.");
            if (digitalRead(g_detector_pin) != BEAM_BROKEN) {
                _selftest_delay = 0;
                _selftest_state = 199;
                return;
            }
            digitalWrite(_emitter_pin, HIGH);
            _selftest_delay = 2;
            _selftest_state = 4;
            return;
        case 4: 
            Serial.println("case 4.");
            if (digitalRead(g_detector_pin) != BEAM_UNBROKEN) {
                _selftest_state = 199;
                return;
            }
            _selftest_delay = 25;
            _selftest_state = 5;
            return;
        case 5: 
            Serial.println("case 5.");
            if (digitalRead(g_detector_pin) != BEAM_UNBROKEN) {
                _selftest_state = 199;
                return;
            }
            // All is okay
            g_inerror = false;
            digitalWrite(_emitter_pin, HIGH);
            _selftest_delay = 50;
            _selftest_state = 200;
            return;
        case 199: // Come here to declare error
            Serial.println("case 199.");
            g_inerror = true;
            digitalWrite(_emitter_pin, HIGH);
            _selftest_delay = 50;
            _selftest_state = 200;
            return;
        case 200:
            Serial.println("case 200.");
            _selftest_state = 0;
            g_ignore_hits = false;
            return;
    }
}

