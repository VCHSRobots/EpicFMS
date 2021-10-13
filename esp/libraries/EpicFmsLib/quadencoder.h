// quadencoder.h -- Quadrature Encoder 
// dlb, Oct 2021
//
// Implements a quadrature encoder on two input pins.

#ifndef QUADENCODER_H
#define QUADENCODER_H

class QuadEncoder {
  public:
    QuadEncoder(uint8_t pina, uint8_t pinb);
    QuadEncoder();
    void begin(void);   // Attaches the pins and starts sensing position.
    long value(void);   // Returns the encoder position in tick counts.
    void setpins(uint8_t pina, uint8_t pinb);
    void debug_report(void);
  private:
    bool _started = false; 
};

#endif
