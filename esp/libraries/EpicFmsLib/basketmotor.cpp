// basketmotor.cpp -- Controls Motor for Basket 
// dlb, Oct 2021


#include "basketmotor.h"

#define TICKS_PER_REV 1024  // Number of encoder ticks per reveloution.
#define MAX_PW_DELTA_PER_UPDATE 1 // Max change to Pwm allowed per update ().
#define PW_UPDATE_MS  40 // Update Period for pwm
#define RPM_DEADZONE 2.0 // Allowable RPM error before changing pwm.

BasketMotor::BasketMotor(uint8_t pinpwm, uint8_t pina, uint8_t pinb) {
    _pinpwm = pinpwm;
    _enc.setpins(pina, pinb);
    _desiredrpm = 0.0;
    _rpm = 0.0;
    _isstuck = false;
    _isjammed = false;
    _isenabled = false;
    _jamcount = 0;
    _lastupdate_us = micros();
    _doing_holdoff = false;
}

void BasketMotor::begin(void) {
    _enc.begin();
    Serial.println("Setting up PWM for motor.");
    _servo.attach(_pinpwm);
    _lastpw = PW_ZERO_RPM;
    _servo.writeMicroseconds(PW_ZERO_RPM);  
    _isenabled = false;
}

void BasketMotor::write_pwm(int pwm) {
    if(pwm > PW_MAX) pwm = PW_MAX;
    if(pwm < PW_MIN) pwm = PW_MIN;
    if(pwm != _lastpw) {
        _servo.writeMicroseconds(pwm);
        _lastpw = pwm;
    }
}

void BasketMotor::do_enabling(void) {
    if (_pending_enable == true) {
        _pending_enable = false;
        _isenabled = true;
        _isstuck = false;
        _isjammed = false; 
        _motorstart_us = _time_now;
        _doing_holdoff = true;
        write_pwm(_pwm_run);
        return;
    }
    write_pwm(PW_ZERO_RPM);
}

void BasketMotor::do_jamclear(void) {
    uint32_t tnow = millis();
    if(tnow - _jam_delay_t0 < _jam_delay) return;
    _jam_delay_t0 = tnow;
    _jam_delay = 0;

    switch(_jamstate) {
        case 0: // come here to start a jerk attempt
            Serial.println("Case 0.");
            write_pwm(PW_ZERO_RPM);
            _jam_delay = 200;
            _jamstate = 1;
            return;
        case 1: // Try njerk times to go forward and back
            Serial.println("Case 1.");
            _ijamjerk++;
            if (_ijamjerk >= _njerks) {
                // We are done with this jerk attempt
                write_pwm(PW_ZERO_RPM);
                _jam_delay = 100;
                _jamstate = 10;
                return;
            }
            write_pwm(_pos_pwm_us);
            _jam_delay = 650;
            _jamstate = 2;
            return;
        case 2:
            Serial.println("Case 2.");
            write_pwm(_neg_pwm_us);
            _jam_delay = 200;
            _jamstate = 1;
            return;
        case 10: // Turn on the motor, monitor for success
            Serial.println("Case 10.");
            write_pwm(_pwm_run);
            _jam_delay = 2000;
            _jamstate = 11;
            return;
        case 11: 
            Serial.println("Case 11.");
            if (_rpm < 8.0) {
                Serial.println("Rpm low.");
                // Didn't work.
                write_pwm(PW_ZERO_RPM); 
                _ijamtry++;
                if(_ijamtry > _ntrys) {
                    Serial.println("Declaring Stuck.");
                    _isstuck = true;
                    _isjammed = false;
                    return;
                }
                _jam_delay = 500; 
                _jamstate = 0;
                return;
            }
            Serial.println("Leaving Jam mode.");
            _isjammed = false;
            _isstuck = false;
            _doing_holdoff = false;
            return;
    }
}

void BasketMotor::do_jamdetection(void) {
    if (_rpm < 3.0) _slowcount++;
    if (_rpm > 10.0) _slowcount = 0;
    if (_slowcount < 25) return;
    _slowcount = 0;
    _isjammed = true;
    _jamcount++;
    _jamstate = 0;
    _ijamtry = 0;
    _ijamjerk = 0;
    _jam_delay_t0 = millis();
    _jam_delay = 0;
}

void BasketMotor::update(void) {
     _time_now = micros();
    uint32_t time_elp_us = _time_now - _lastupdate_us;
    if (time_elp_us < 2000) return;        // Allow at least 2ms between updates.
    _lastupdate_us = _time_now;
    float time_elp = time_elp_us * 1.e-6;  // Convert to seconds
    long enc_now = _enc.value();
    float revs = float(enc_now - _lastencoderpos) / float(TICKS_PER_REV);
    _lastencoderpos = enc_now;
    float newrpm = 60.0 * revs / time_elp;
    _rpm = (0.2 * newrpm) + (.8 * _rpm);
    if (_isjammed) {
        do_jamclear();
        return;
    }
    if (!_isenabled) {
         do_enabling();
         return;
    }
    if (_isstuck) {
        write_pwm(PW_ZERO_RPM);
        return;
    }
    if (_doing_holdoff) {
        if( _time_now - _motorstart_us < 250000) return;
         _doing_holdoff = false;
    }
    write_pwm(_pwm_run);  // Rewrite it, just incase it changed.
    do_jamdetection();
}

void BasketMotor::debug_report(void) {
    char lineout[150];
    sprintf(lineout, "Motor Enable: %d, IsJammed=%d, IsStuck=%d, Jamcount=%ld, rpm=%8.2f",
        _isenabled, _isjammed, _isstuck, _jamcount, _rpm);
    Serial.println(lineout);
    sprintf(lineout, "desired_rpm = %8.2f, pw=%d us, holdoff=%d, rpm_err=%8.2f",
        _desiredrpm, _lastpw, _doing_holdoff, _rpm_error);
    Serial.println(lineout);
    _enc.debug_report();
}

// Sets the desired rpm.  Takes effect on next update.
void BasketMotor::setrpm(float rpm) {
    _desiredrpm = rpm;
}

// Sets the desired pulsewidth in us for pwm.  Takes effect on next update.
void BasketMotor::setpwm(int pwm) {
    _pwm_run = pwm;
}

// Enables the motor. Takes effect on next update.  Note:
// enabling the motor after being disabled will clear
// the jaming clearing and stuck conditions.
void BasketMotor::enable(void) {
    if(!_isenabled) {
        _pending_enable = true;
    }
}

// Disables the motor. Takes effect immediatly.
void BasketMotor::disable(void) {
    _pending_enable = false;
    if(_isjammed) {
        // Since we are quitting, promote any unjamming attempt
        // into a stuct condition.
        _isstuck = true;
        _isjammed = false;
    }
    _isenabled = false;
    _lastpw = PW_ZERO_RPM;
    _servo.writeMicroseconds(PW_ZERO_RPM); 
}

// Resets to initial state -- not enabled, no jam, not stuck, and zeros the counts.
void BasketMotor::reset(void) {
    _desiredrpm = 0.0;
    _isstuck = false;
    _isjammed = false;
    _isenabled = false;
    _jamcount = 0;
    _lastpw = PW_ZERO_RPM;
    _servo.writeMicroseconds(PW_ZERO_RPM);
}

// Returns the currently measured rpm.
float BasketMotor::currentrpm(void) {
    return _rpm;
}

// Returns the last commanded pulsewidth, in us.
int BasketMotor::currentpwm(void) {
    return _lastpw;
}

// Returns the pulsewidth, in us, to use when running normally.
int BasketMotor::runpwm(void) {
    return _pwm_run;
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

// This is PID code that sorta worked.  Save to use
// of we ever get the quadrature encoder working for high speeds.   
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

// This code provides a dummy replacement for BasketMotor -- useful in debugging.
// class BasketMotorDummy {
//   public:
//   BasketMotorDummy(int pwm, int a, int b) { }
//    void begin(void) {}         // Begins the operation.
//    void update(void) {}        // Updates the PID loop.  Call at least every 100ms.
//    void setrpm(float rpm) {}   // Sets the desired rpm. (Doesn't work cause no PID for now)
//    void setpwm(int pwm) {}     // Sets the pulsewidth for PWM to use for enabled mode.
//    void enable(void) {}        // Enables the motor.
//    void disable(void) {}       // Disabled the motor.
//    void reset(void) {}         // Resets a stuck condition, presumely after a human clears the jam.
//    float currentrpm(void) {}   // Returns the measured rpm at the last update.
//    int  currentpwm(void) {}    // Returns the currently used pwm.
//    int  runpwm(void){}         // Returns the pwm to use when running normally.
//    long encoderpos(void){}     // Encoder Position
//    bool isenabled(void) {}     // Returns true if the motor is enabled       
//    bool injam(void) {}         // Returns true if in a jam condition.
//    bool isstuck(void) {}       // Returns true if the motor is stuck.
//    long jamcount(void) {}      // Returns the number of successful jam clears since last reset.
//    void set_params(int ntrys, int njerks, int pos_pwm_us, int neg_pwm_us, int spike_ms) {}
//    void debug_report(void) {}  // Reports debugging info to terminal.
// };


