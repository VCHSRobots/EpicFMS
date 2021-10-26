// hitdetector4.h -- Hit Detector -- Four Crossed Beam Version
// dlb, Oct 2021

#ifndef HITDETECTOR4_H
#define HITDETECTOR4_H

#define HDSTATUS_OFF        0 // The detector has not been started with begin()
#define HDSTATUS_OKAY       1 // Detector is operational
#define HDSTATUS_INSELFTEST 2 // Self testint under way
#define HDSTATUS_ERROR      3 // An error condition has been asserted.

class HitDetector4 {
  public:
    HitDetector4();
    HitDetector4(int pin_e1, int pin_e2, int pin_e3, int pin_e4,
        int pin_d1, int pin_d2, int pin_d3, int pin_d4);
    void setpins(int pin_e1, int pin_e2, int pin_e3, int pin_e4,
        int pin_d1, int pin_d2, int pin_d3, int pin_d4); 
    void begin(void);          // Attaches the pins and starts sensing hits.
    void update(void);         // Call at least every 20 ms.
    long value(void);          // Returns the number of hits detected.
    int get_status(void);      // Returns the status of the detector.
    void start_selftest(void); // Starts a self test.  Do this to attempt to clear error.
    void reset_hits(void);     // Reset the hit count
    int get_fail_code(void);   // Returns a number indicating why selftest failed.
    void debug_report(void);   // Prints a debug report to the terminal.
    const char *get_status_str(void); // Gets a short string to indicate status.
  private:
    bool _started = false;
    int _selftest_state;
    uint32_t _selftest_delay;
    uint32_t _selftest_delay_t0;
    int _selftest_emitter_num = 0;
    int _selftest_fail_code = 0;
    void conduct_selftest(void); // Runs the self test 
};

#endif