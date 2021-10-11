// basketmotor.cpp -- Controls Motor for Basket 
// dlb, Oct 2021


#include "basketmotor.h"

#define TICKS_PER_REV 2048  // Number of encoder ticks per reveloution.


BasketMotor::BasketMotor(int pinpwm, int pina, int pinb) {
    _pinpwm = pinpwm;
    _enc.setpins(pina, pinb);
    _desiredrpm = 0.0;
    _rpm = 0.0;
    _isstuck = false;
    _isjammed = false;
    _isenabled = false;
    _jamcount = 0;
    _lastupdate_us = micros();
}

void BasketMotor::begin(void) {
    _enc.begin();
    Serial.println("Setting up PWM for motor.");
    _servo.attach(_pinpwm);
    _lastpw = PW_ZERO_RPM;
    _servo.writeMicroseconds(PW_ZERO_RPM);  
    _isenabled = false;
}

void BasketMotor::update(void) {
    unsigned long time_now = micros();
    unsigned long time_elp_us = time_now - _lastupdate_us;
    if (time_elp_us < 2000) return;        // Allow at least 2ms between updates.
    _lastupdate_us = time_now;
    float time_elp = time_elp_us * 1.e-6;  // Convert to seconds
    long enc_now = _enc.value();
    float revs = float(enc_now - _lastencoderpos) / float(TICKS_PER_REV);
    _lastencoderpos = enc_now;
    float newrpm = 60.0 * revs / time_elp;
    _rpm = (0.1 * newrpm) + (.9 * _rpm);   // Filter the RPM, about 20ms to clear
    int newpw = PW_ZERO_RPM;
    if (_isenabled) newpw = PW_RUN0;
    else newpw = PW_ZERO_RPM;
    if(newpw != _lastpw) {
        _servo.writeMicroseconds(newpw);
        _lastpw = newpw;
    }
}

void BasketMotor::debug_report(void) {
    char lineout[100];
    sprintf(lineout, "Motor rpm=%f, encpos=%ld, jamcount=%ld", 
        _rpm, encoderpos(), _jamcount);
    Serial.println(lineout);
}

// Sets the desired rpm.  Takes effect on next update.
void BasketMotor::setrpm(float rpm) {
    _rpm = rpm;
}

// Enables or disables the motor. Taks effect on next update.
void BasketMotor::enable(bool run) {
    if (!run) {
        _isenabled = false;
        return;
    }
    if (_isstuck) return;
    _isenabled = true;
}

// Resets to initial state -- not enabled, no jam, not stuck, and zeros the counts.
void BasketMotor::reset(void) {
    _desiredrpm = 0.0;
    _isstuck = false;
    _isjammed = false;
    _isenabled = false;
    _jamcount = 0;
}

// Returns the currently measured rpm.
float BasketMotor::currentrpm(void) {
    return _rpm;
}

// Returns the currently measured encoder position, in ticks.
long BasketMotor::encoderpos(void) {
    return _enc.value();
}

// Returns true if the motor is enabled.
bool BasketMotor::isenabled(void) {
    return _isenabled;
}

// Returns true if a jam is detected and trying to be cleared.
bool BasketMotor::injam(void) {
    return _isjammed;
}

// Returns true if the motor is stuck. 
bool BasketMotor::isstuck(void) {
    return _isstuck;
}

// Returns the number of jams that have been cleared since last reset.
long BasketMotor::jamcount(void) {
    return _jamcount;
} 

// Sets the various parameters that control how jam clearing works.
void BasketMotor::set_params(int ntrys, int njerks, int pos_pwm_us, int neg_pwm_us, int spike_ms) {
    _ntrys = ntrys;
    _njerks = njerks;
    _pos_pwm_us = pos_pwm_us;
    _neg_pwm_us = neg_pwm_us;
    _spike_ms = spike_ms;
}


