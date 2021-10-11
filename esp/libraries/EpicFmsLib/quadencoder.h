// quadencoder.h -- Quadrature Encoder 
// dlb, Oct 2021
//
// Implements a quadrature encoder on two input pins.

#ifndef QUADENCODER_H
#define QUADENCODER_H

class QuadEncoder {
  public:
    QuadEncoder(int pina, int pinb);
    QuadEncoder();
    void begin(void);   // Attaches the pins and starts sensing position.
    long value(void);   // Returns the encoder position in tick counts.
    void setpins(int pina, int pinb);
  private:
    bool _started = false; 
};

#endif
