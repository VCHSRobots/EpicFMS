// basketmotor.h -- Motor controller for basket unit for EpicFMS
// dlb, Oct 2021
//
// This motor controller spins a basket that clears balls out of a hopper.
// The spin rate can be set, and is controlled by a simple PID loop.
// Jams are detected, and an automatic sequence of jerking is used
// to attempt to clear a jam.  If after jerking multiple times, a jam 
// cannot be cleared, a "stuck" condition is declared and the motor is
// shut off.  A stuck condition can be cleared after a human fixes the
// stoppage, and reset() is called. 

#ifndef PWMMOTOR_H
#define PWMMOTOR_H

#include <Servo.h>
#include "quadencoder.h"

#define PW_ZERO_RPM 1500  // Pulsewidth, in us, for zero RPM
#define PW_MAX      1900  // Max pulsewidth allowed.
#define PW_MIN      1200  // Min pulsewidth allowed.
#define PW_RUN0     1400  // Initial pulsewidth when starting the motor  
#define PW_US_RPM      2  // Used in equation for accelaration in PID loop 

class BasketMotor {
 public:
    BasketMotor(int pinpwm, int pina, int pinb);
    void begin(void);         // Begins the operation.
    void update(void);        // Updates the PID loop.  Call at least every 100ms.
    void setrpm(float rpm);   // Sets the desired rpm.
    void enable(bool run);    // Enables/Disabled the motor.
    void reset(void);         // Resets a stuck condition, presumely after a human clears the jam.
    float currentrpm(void);   // Returns the measured rpm at the last update.
    long encoderpos(void);    // Encoder Position
    bool isenabled(void);     // Returns true if the motor is enabled       
    bool injam(void);         // Returns true if in a jam condition.
    bool isstuck(void);       // Returns true if the motor is stuck.
    long jamcount(void);      // Returns the number of successful jam clears since last reset.

    void set_params(int ntrys, int njerks, int pos_pwm_us, int neg_pwm_us, int spike_ms);
    void debug_report(void);  // Reports debugging info to terminal.
 private:
    int _pinpwm;           // Pin for the pwm that controls the motor
    QuadEncoder _enc;      // Quadrature encoder
    Servo _servo;          // Servo -- for PWM output.
    float _desiredrpm;     // Desired rpm of the motor
    float _rpm;            // Currently measured rpm of the motor
    long _lastencoderpos;  // Encoder postion at last update.
    unsigned long _lastupdate_us;   // Time of the last update
    bool _isstuck;
    bool _isenabled;
    bool _isjammed;
    long _jamcount;        // Number of jams that have been cleared.
    int _lastpw;           // Last commanded pulsewidth for pwm.

    int _ntrys = 4;        // Number of sets of jerks before giving up.
    int _njerks = 4;       // Number of jerks per jam clear attempt.
    int _neg_pwm_us = 1300;  // Microseconds of PWM pulse on neg side of clear attempt.
    int _pos_pwm_us = 1800;  // Microseconds of PWM pulse on pos side of clear attempt.
    int _spike_ms;           // Milliseconds to spike PWM.
    int _usperrpm = 1;       // Used to calculate initial pulsewidth for rpm setting.
    int _cur_us;             // Current pulsewidth setting. Relative to center of 1500.

};

#endif