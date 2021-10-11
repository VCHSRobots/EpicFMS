// quadencoder.cpp -- Quadrature Encoder 
// dlb, Oct 2021
//
// Implements a quadrature encoder on two input pins.  
// BEWARE -- only one instance of this class is allowed!

#include <Arduino.h>
#include "quadencoder.h"

volatile long g_encoderpos = 0;
int g_pina;
int g_pinb;
int g_declared = 0;  

ICACHE_RAM_ATTR void isr_encoderA() {
  int a = digitalRead(g_pina);
  int b = digitalRead(g_pinb);
  if (a == HIGH) {
      if (b == LOW) g_encoderpos++;
      else g_encoderpos--;
  } else {
      if (b == LOW) g_encoderpos--;
      else g_encoderpos++;
  }
}

ICACHE_RAM_ATTR void isr_encoderB() {
  int a = digitalRead(g_pina);
  int b = digitalRead(g_pinb);
  if (b == HIGH) {
      if (a == HIGH) g_encoderpos++;
      else g_encoderpos--;
  } else {
      if (a == LOW) g_encoderpos--;
      else g_encoderpos++;
  }
}

QuadEncoder::QuadEncoder(void) {
    QuadEncoder(-1, -1); 
}

QuadEncoder::QuadEncoder(int pina, int pinb) {
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
  if (g_pina < 0 || g_pinb < 0) {
      Serial.println("QuadEncoder not initailized before begin!!!");
      return;
  }
  if(_started) return;
  //Serial.println("Setting up Interrupts for encoder.");
  pinMode(g_pina, INPUT);
  pinMode(g_pinb, INPUT);
  attachInterrupt(g_pina, isr_encoderA, CHANGE);
  attachInterrupt(g_pinb, isr_encoderB, CHANGE);
  _started = true;
}

void QuadEncoder::setpins(int pina, int pinb) {
    if (_started) {
        Serial.println("Unable to set pins on QuadEnccoder after begin!!!");
        return;
    }
    g_pina = pina;
    g_pinb = pinb;
}


