// hit_testing_4.ino -- Tests the IR Beams for detection
// Epic Robotz, dlb, Sept 2021

// This sketch expands on hit_testing, in that it inputs
// four signals from the IR detectors.  And, in this 
// version, the code has control over each of the 
// emitters.  That allows us to do a Power On Self Test (POST).

// Note: for this circuit, we do not assume that the 
// wiring for an emitter matches a detector in a fixed order.
// This code features a search to match the emitters and
// detectors as part of the POST.

// This sketch also assumes that there are four LED that
// can be used as a binary display.  If the POST succeds,
// then the binary display shows the hit count.  

// However, for now, if the POST fails, then the binary
// display shows a flashing pattern that indicates an 
// error.  To clear the error, the sketch must be restarted.
//
// SPI Message Structure:
// The input message should have the following 
//    Byte 0:  '1010 xxxx   -- Where xxxx is the version of the message
//    Byte 1:  cmd          -- The command. Meaning listed below.
//    Bytes 2-N:  0000 0000 -- Remaining bytes, sent for reading.

// The output SPI message always has the following content:
//    Byte 0:  1011 xxxx   -- Where xxxx is the version of the message
//    Byte 1:  status      -- A status byte, with varous meaning, see below.
//    Byte 2:  batv        -- Battery voltage, LSB = 0.1 volts
//    Byte 3:  count1      -- MSByte of hit count
//    Byte 4:  count0      -- LSByte of hit count 
//
// Currently the SPI message is 5 bytes long.  See the #defines
// in the code for cmd and status.  As of now, there is only
// one version of the messages, xxxx = 0001.  
//

#include <Arduino.h>
#include "SPI.h"

// *** Assign the pins 
// These pins go high on detection.
// DO NOT CHANGE the irx_pin constants without rewriting the interrupt enable code in setup()!
const int ir1_pin = 4;
const int ir2_pin = 5;
const int ir3_pin = 6;
const int ir4_pin = 7;
// These pins control the emitters.
const int emitter1_pin = 2;
const int emitter2_pin = 3;
const int emitter3_pin = 8;
const int emitter4_pin = 9;
// These pins implement a binary LED display.
const int disp1_pin = A2; 
const int disp2_pin = A3;
const int disp3_pin = A4;
const int disp4_pin = A5;

// Define the run modes
#define RM_NORMAL 0
#define RM_DANCE 1  // used to indicate an error in the mapping sequence.
#define RM_BLINK 2  // Used to indicate an error in the ring check

// Define the SPI message
#define SPI_MSG_LEN 5 
#define SPI_STATUS_OKAY      0        // All normal, counting enabled.
#define SPI_STATUS_POSTING   1        // Means the post is running 
#define SPI_STATUS_POST_ERR1 2        // Post mapping error -- counting not enabled
#define SPI_STATUS_POST_ERR2 3        // Post ring error -- counting not enabled
#define SPI_CMD_NOOP         0        // Command is a no-op
#define SPI_CMD_CLEAR_ERRORS 1        // Clear all errors, retry post
#define SPI_CMD_CLEAR_COUNTS 2        // Clear hit count
#define SPI_FRIST_BYTE       0b11010001 // First Byte to Send

// Define the variable for the logic
volatile unsigned long hit_count = 0;
volatile unsigned long hit_time = 0;
volatile bool ready_for_hit = true;
int raw_emitter_pins[4] = {emitter1_pin, emitter2_pin, emitter3_pin, emitter4_pin};
int raw_detector_pins[4] = {ir1_pin, ir2_pin, ir3_pin, ir4_pin};
int emitter_indexes[4];  // Holds the indexes of the pins for the emitters in order.
byte spi_msg[SPI_MSG_LEN];          // Holds the output SPI message. 
unsigned long spi_hitcount = 0;    // Holds snapshot of hit_count
byte spi_run_mode = 0;             // Holds snapshot of run_mode 
byte run_mode = RM_NORMAL;         // See the RM defines above
byte bat_volts = 70;               // Battery voltage -- in 0.1v increments
char lineout[100];                 // For output to debug termainal

// Define variables for SPI
char cmdbuf[30];
volatile byte cmdindx;
volatile byte cmdprocess;

// ++++++++ setup() 
void setup() {
  Serial.begin(115200);
  Serial.println("Epic FMS Hit Counter -- Version 1 -- Sept 2021");
  Serial.println("");
  pinMode(emitter1_pin, OUTPUT);
  pinMode(emitter2_pin, OUTPUT);
  pinMode(emitter3_pin, OUTPUT);
  pinMode(emitter4_pin, OUTPUT);

  // Turn on the emitters for now..
  digitalWrite(emitter1_pin, HIGH);
  digitalWrite(emitter2_pin, HIGH);
  digitalWrite(emitter3_pin, HIGH);
  digitalWrite(emitter4_pin, HIGH);

  // Turn on the binary display
  pinMode(disp1_pin, OUTPUT);
  pinMode(disp2_pin, OUTPUT);
  pinMode(disp3_pin, OUTPUT);
  pinMode(disp4_pin, OUTPUT);

  bool okay = do_self_check();
  if (!okay) return;

  // For detection, we are using D4, D5, D6, D7... 
  // These are defined in our constants ir1_pin through ir4_pin.
  // In the Atmega for the NANO, these are mapped as follows:
  //
  //    D4 = PD4 = PCINT20
  //    D5 = PD5 = PCINT21
  //    D6 = PD6 = PCINT22
  //    D7 = PD7 = PCINT23
  //
  // All these pins can trigger the same pin change interrupt, i.e,
  // "Pin Change Interrupt 2.", for which the corresponding ISR is
  // "PCINT2_vect".  Below, the interrupt is enabled, and the mask
  // is set so that any of the above 4 pins can trigger it.  Also
  // the mask is set so that none of the other pins (D0-D3) on
  // this same interrupt can trigger it.

  PCICR |= 4;    // Turns on PCINT[23:16] (all 8 pins)
  PCMSK2 = 0x00F0; // With above, turns on interrupt Change for pins D5-D7 only.
  cmdindx = 0;
  cmdprocess = false;
  SPI.attachInterrupt();

  // Now we are ready.., so: 
  turn_on_all_emitters();

  Serial.println("Setting up SPI.");
  pinMode(MISO, OUTPUT);  // We are the slave, so drive this pin to send our data.
  SPCR |= _BV(SPE);  // turn on SPI in slave mode
  spi_msg[0] = SPI_FRIST_BYTE;

  Serial.println("Starting normal operation.");
}

// loop() -- main loop.
void loop() {
  if (cmdprocess) {
    sprintf(lineout, "Cmd Received: %s.  Hit Count = %ld", cmdbuf, hit_count);
    Serial.println(lineout);
    cmdprocess = false;
    // Load out the transmission reg here?
    SPDR = spi_msg[0];
  }
  if (run_mode == RM_NORMAL) {
    if (!ready_for_hit) {
      if (micros() - hit_time > 20000) {
        ready_for_hit = true;
      }
    }
    display_hit_count(hit_count);
  }
  if (run_mode == RM_DANCE) {
    digitalWrite(disp1_pin, HIGH);
    digitalWrite(disp2_pin, HIGH);
    digitalWrite(disp3_pin, LOW);
    digitalWrite(disp4_pin, LOW);
    delay(100);
    digitalWrite(disp1_pin, LOW);
    digitalWrite(disp2_pin, LOW);
    digitalWrite(disp3_pin, HIGH);
    digitalWrite(disp4_pin, HIGH);
    delay(100);
  }
  if (run_mode == RM_BLINK) {
    digitalWrite(disp1_pin, HIGH);
    digitalWrite(disp2_pin, LOW);
    digitalWrite(disp3_pin, HIGH);
    digitalWrite(disp4_pin, LOW);
    delay(100);
    digitalWrite(disp1_pin, LOW);
    digitalWrite(disp2_pin, HIGH);
    digitalWrite(disp3_pin, LOW);
    digitalWrite(disp4_pin, HIGH);
    delay(100);
  }
}

// ISR -- here is the interrupt handler.  We assume
// that it can only be called if one of the four
// detectors changes state.
ISR(PCINT2_vect) {
  if (!ready_for_hit) return;
  // We are only looking for a LOW to HIGH change 
  // on any one of the detectors.  If we don't find
  // that, ignore this interrupt.
  if (digitalRead(ir1_pin) == LOW && digitalRead(ir2_pin) == LOW &&
    digitalRead(ir3_pin) == LOW && digitalRead(ir4_pin) == LOW) return; 
  hit_time = micros();
  hit_count++;
  ready_for_hit = false;
}

ISR(SPI_STC_vect) {
  if (cmdprocess) return;  // If we haven't finished processing last, then ignore
  byte c = SPDR;  // read byte from SPI Data Register
  if (cmdindx == 0) {
    spi_msg[1] = run_mode;
    spi_msg[2] = bat_volts;
    memcpy(spi_msg + 3, hit_count, 2); 
  }
  if (cmdindx < SPI_MSG_LEN) {
    SPDR = spi_msg[cmdindx + 1];  // Send back data
  }
  if(cmdindx < sizeof cmdbuf) {
    cmdbuf[cmdindx++] = c;
    if(c == '\r') {
      cmdprocess = true;
      cmdbuf[cmdindx] = 0;
      cmdindx = 0;
    }
  }
}
