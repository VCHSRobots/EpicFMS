// quadencoder.cpp -- Quadrature Encoder 
// dlb, Oct 2021

// Implements a quadrature encoder on two input pins.  
// BEWARE -- only one instance of this class is allowed!

// ALSO Beware: for some reason both inputs cannot be used
// as interrupt pins at the same time -- it produces very
// erronious readings.  I suppect this is because if a pin
// is being monitored for an interrupt, you cannot also,
// at the same time, use it as a simple input as well.
//
// In addition, I had trouble with the CHANGE setting, 
// which should capture both rising and falling edges of
// the input.  For some reason, on CHANGE, the reads of
// the inputs are irratic. 
//
// Therefore, this code only samples on the rising edge
// of input A.  This gives a reliable measurment, 
// but at a loss of a factor of 4 in resolution.

#include <Arduino.h>
#include "quadencoder.h"

volatile long g_encoderpos = 0;
uint8_t g_pina;
uint8_t g_pinb;
bool g_declared = false; 
long g1=0; long g2=0; long g3=0; long g4=0; 

IRAM_ATTR void isr_encoderA() {
  noInterrupts();
  //delayMicroseconds(10);  <- this didn't seem to make a difference.
  //int a = digitalRead(g_pina); <- assume this is high, below.
  int a = HIGH; 
  int b = digitalRead(g_pinb);
  if (a == HIGH) {
      if (b == LOW) { g_encoderpos++; g1++; }
      else { g_encoderpos--; g2++;}
  } else {
      if (b == HIGH) { g_encoderpos++; g3++; }
      else { g_encoderpos--; g4++; }
  }
  interrupts();
}

// This is kept in the code so that someday we can figure out
// why it doesn't work.  But it is NOT called.
IRAM_ATTR void isr_encoderB() {
  int a = digitalRead(g_pina);
  int b = digitalRead(g_pinb);
  if (b == HIGH) {
      if (a == HIGH) g_encoderpos++;
      else g_encoderpos--;
  } else {
      if (a == LOW) g_encoderpos++;
      else g_encoderpos--;
  }
}

QuadEncoder::QuadEncoder(void) {
    QuadEncoder(-1, -1); 
}

QuadEncoder::QuadEncoder(uint8_t pina, uint8_t pinb) {
    if (g_declared) {
        Serial.println("Unable to create two instances of QuadEncoder!!!");
        return;
    }
    g_declared = 1;
    g_pina = pina;
    g_pinb = pinb;
    _started = false;
}

long QuadEncoder::value(void) {
    return g_encoderpos;
}

void QuadEncoder::begin(void) {
  if(_started) return;
  //Serial.println("Setting up Interrupts for encoder.");
  pinMode(g_pina, INPUT);
  pinMode(g_pinb, INPUT);
  attachInterrupt(g_pina, isr_encoderA, RISING);
  //attachInterrupt(g_pinb, isr_encoderB, RISING); // !!! See above.
  _started = true;
}

void QuadEncoder::setpins(uint8_t pina, uint8_t pinb) {
    if (_started) {
        Serial.println("Unable to set pins on QuadEnccoder after begin!!!");
        return;
    }
    g_pina = pina;
    g_pinb = pinb;
}

void QuadEncoder::debug_report(void) {
    char lineout[100];
    sprintf(lineout, "Encoder Position: %ld.  g:  %ld, %ld, %ld, %ld.", g_encoderpos, g1, g2, g3, g4);
    Serial.println(lineout);
}


