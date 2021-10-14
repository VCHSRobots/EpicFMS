// hitdetector.h -- Hit Detector -- Single IR Beam Version
// dlb, Oct 2021

#ifndef HITDETECTOR_H
#define HITDETECTOR_H

#define HDSTATUS_OFF        0 // The detector has not been started with begin()
#define HDSTATUS_OKAY       1 // Detector is operational
#define HDSTATUS_INSELFTEST 2 // Self testint under way
#define HDSTATUS_ERROR      3 // An error condition has been asserted.

class HitDetector {
  public:
    HitDetector(int emitter_pin, int detector_pin);
    HitDetector();
    void setpins(int emitter_pin, int detector_pin); // Sets the pin after construction.
    void begin(void);          // Attaches the pins and starts sensing hits.
    void update(void);         // Call at least every 20 ms.
    long value(void);          // Returns the number of hits detected.
    int get_status(void);      // Returns the status of the detector.
    void start_selftest(void); // Starts a self test.  Do this to attempt to clear error.
    void debug_report(void);   // Prints a debug report to the terminal.
    const char *get_status_str(void); // Gets a short string to indicate status.
  private:
    int _selftest_state;
    uint32_t _selftest_delay;
    uint32_t _selftest_delay_t0;
    int _emitter_pin;
    int _detector_pin;
    bool _started = false;  
    void conduct_selftest(void); // Runs the self test 
};

#endif
