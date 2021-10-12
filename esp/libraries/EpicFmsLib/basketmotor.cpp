// basketmotor.cpp -- Controls Motor for Basket 
// dlb, Oct 2021


#include "basketmotor.h"

#define TICKS_PER_REV 1024  // Number of encoder ticks per reveloution.
#define MAX_PW_DELTA_PER_UPDATE 1 // Max change to Pwm allowed per update ().
#define PW_UPDATE_MS  40 // Update Period for pwm
#define RPM_DEADZONE 2.0 // Allowable RPM error before changing pwm.

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
    _doing_pid_holdoff = false;
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
    _rpm = (0.05 * newrpm) + (.95 * _rpm);   // Filter the RPM, about 20ms to clear
    float newpw = PW_ZERO_RPM;
    if (_pending_enable != _isenabled) {
        // We need to make a change to the enable status, and probably the pwm.
        _isenabled = _pending_enable;
        _pid_holdoff_us = time_now + 200000ul;  // Hold off on PID for 200ms.
        _doing_pid_holdoff = true;
        newpw = PW_RUN0; 
    }
    if (!_isenabled) newpw = PW_ZERO_RPM;
    else {
        newpw = PW_RUN0;
        // if (_doing_pid_holdoff) {
        //     if( time_now - _pid_holdoff_us > 0)  _doing_pid_holdoff = false;
        //     _last_pwm_update_us = time_now;
        // }
        // if(!_doing_pid_holdoff) {
        //     if (time_now - _last_pwm_update_us > PW_UPDATE_MS) {
        //         _last_pwm_update_us = time_now;
        //         newpw = _lastpw;
        //         _rpm_error = _desiredrpm - _rpm;
        //         float abs_rpm_error = _rpm_error;
        //         if (abs_rpm_error < 0.0) abs_rpm_error = 0.0 - abs_rpm_error;
        //         if (abs_rpm_error > RPM_DEADZONE) {  
        //             if (_rpm_error > 0.0) {
        //                 newpw -= MAX_PW_DELTA_PER_UPDATE;
        //             } else {
        //                 newpw += MAX_PW_DELTA_PER_UPDATE;
        //             }
        //         }
        //     }
        // }
    }
    if(newpw > PW_MAX) newpw = PW_MAX;
    if(newpw < PW_MIN) newpw = PW_MIN;
    if(newpw != _lastpw) {
        _servo.writeMicroseconds(newpw);
        _lastpw = newpw;
    }
}

void BasketMotor::debug_report(void) {
    char lineout[150];
    sprintf(lineout, "Motor Enable: %d, Motor rpm=%8.2f, jamcount=%ld",
        _isenabled, _rpm, _jamcount);
    Serial.println(lineout);
    sprintf(lineout, "desired_rpm = %8.2f, pw=%d us, holdoff=%d, rpm_err=%8.2f",
        _desiredrpm, _lastpw, _doing_pid_holdoff, _rpm_error);
    Serial.println(lineout);
    
    _enc.debug_report();
}

// Sets the desired rpm.  Takes effect on next update.
void BasketMotor::setrpm(float rpm) {
    _desiredrpm = rpm;
}

// Enables or disables the motor. Taks effect on next update.
void BasketMotor::enable(bool enable) {
    if (!enable) {
        _pending_enable = false;
        return;
    }
    if (_isstuck) return;
    _pending_enable = true;
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


