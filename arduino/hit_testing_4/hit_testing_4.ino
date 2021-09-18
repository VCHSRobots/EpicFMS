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


// *** Assign the pins 
// These pins go high on detection.
// DO NOT CHANGE the irx_pin constants without rewriting the interrupt enable code in setup()!
const int ir1_pin = 7;
const int ir2_pin = 6;
const int ir3_pin = 5;
const int ir4_pin = 4;
// These pins control the emitters.
const int emitter1_pin = 12;
const int emitter2_pin = 11;
const int emitter3_pin = 10;
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

// Define the variable for the logic
volatile unsigned long hit_count = 0;
volatile unsigned long hit_time = 0;
volatile bool ready_for_hit = true;
int raw_emitter_pins[4] = {emitter1_pin, emitter2_pin, emitter3_pin, emitter4_pin};
int raw_detector_pins[4] = {ir1_pin, ir2_pin, ir3_pin, ir4_pin};
int emitter_indexes[4];  // Holds the indexes of the pins for the emitters in order.
int run_mode = RM_NORMAL;  // See the RM defines above
char lineout[100];

void turn_off_all_emitters() {
  for (int i = 0; i < 4; i++) digitalWrite(raw_emitter_pins[i], LOW);
  delay(1);
}

void turn_on_all_emitters() {
  for (int i = 0; i < 4; i++) digitalWrite(raw_emitter_pins[i], HIGH);
  delay(1);
}

void turn_on_emitter(int index) {
  digitalWrite(raw_emitter_pins[index], HIGH);
  delay(1);
}

// do_mapping() -- attempts to pair the emitters
// and collectors.  If error, returns false.
bool do_mapping() {
  for (int ichan =  0; ichan < 4; ichan++) {
    turn_off_all_emitters();
    // If all the emitters are off, then this simulates a detection, therefore
    // if any channel is not detecting, then something is wrong.
    for (int k = 0; k < 4; k++) {
      int reading = digitalRead(raw_detector_pins[k]);
      if (reading == LOW) {
        sprintf(lineout, "In do_mapping. Failed at raw_detector_pins. reading=%d, k=%d, raw_detector_pins[k] = %d", reading, k, raw_detector_pins[k]);
        Serial.println(lineout);  
        return false;
      }
    }
    // Good. Now turn the beam on for the channel we are working on, and
    // look for a "non-detection."  If we count more than one non-detection,
    // something is wrong.  Or if the pin that the non-detection is active,
    // and its already been used for a differnet channel, that is also an error.
    turn_on_emitter(ichan);
    int non_detect_count = 0;
    int index_of_non_detect = -1;
    for (int j = 0; j < 4; j++) {
      if (digitalRead(raw_detector_pins[j]) == LOW) {
        non_detect_count++;
        if (non_detect_count > 1) {
          // Too many detections for this channel.
          sprintf(lineout, "In do_mapping. Too many detections for one channel.  Chan=%d."); Serial.println(lineout);
          sprintf(lineout, "Reading j=%d index.  The index already taken = %d.", j, index_of_non_detect); 
          Serial.println(lineout);
          return false;  
        }
        index_of_non_detect = j;
        for (int k = 0; k < ichan - 1; k++) {
          if (emitter_indexes[k] == index_of_non_detect) return false;  // Emitter index already used.
        }  
        emitter_indexes[ichan] = index_of_non_detect;
      }
    }
  }
  return true;  // The emitter_indexes table should be filled up correctly.
}

// do_ring_check() -- fires the emitters one at a time and makes sure that their corresponding 
// detector sees the beam.  Returns false on error.
bool do_ring_check() {
  for (int ichan = 0; ichan < 4; ichan++) {
    turn_off_all_emitters();
    // Turn on one emitter, make sure it's detector sees the beam and none of the others do.
    turn_on_emitter(ichan);
    int nfound = 0;
    int index_found = -1;
    for (int k = 0; k < 4; k++) {
      if (digitalRead(raw_detector_pins[k]) == LOW) {
        nfound++;
        index_found = k;
      }
    }
    if (nfound != 1) {
      // Either nothing was found, or more than one detector was found. 
      // Bad either way.
      sprintf(lineout, "In ring_check. Expected to find one beam. Found=%d", nfound); 
      Serial.println(lineout);
      return false;
    }
    if (index_found != emitter_indexes[ichan]) {
      sprintf(lineout, "In ring_check. Index found doesn't match mapping. Index found = %d.", index_found);
      Serial.println(lineout);
      sprintf(lineout, "Working on channel = %d. Mapping = %d, %d, %d, %d.", ichan, 
        emitter_indexes[0], emitter_indexes[1], emitter_indexes[2], emitter_indexes[3]);
      Serial.println(lineout);
      // Wrong index found.  Something wrong.
      return false;
    } 
  }
  return true;
}

// do_self_check() -- Returns true if hardware seems okay.
bool do_self_check() {
  Serial.println("Starting Self Test.");
  bool okay = do_mapping();
  if (!okay) { 
    run_mode = RM_DANCE;
    Serial.println("Mapping failed.");
    return;
  }
  sprintf(lineout, "Mapping Successful. Index are: %d, %d, %d, %d.",
    emitter_indexes[0], emitter_indexes[1], emitter_indexes[2], emitter_indexes[3]);
  Serial.println(lineout);
 
  okay = do_ring_check();
  if (!okay) {
    run_mode = RM_BLINK;
    Serial.println("Ring_check failed.");
    return;
  }
  Serial.println("Ring_check successful.");
  Serial.println("Self Test complete: Hardware seems functional.");
  Serial.println("");
  run_mode = RM_NORMAL;
  return true;
}

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
  PCMSK2 = 0xF0; // With above, turns on interrupt Change for pins D5-D7 only.

  // Now we are ready.., so: 
  turn_on_all_emitters();

  Serial.println("Starting normal operation.");
}

// display_hit_count() -- writes the modulo of the input
// the the display LEDs.
void display_hit_count(int c) {
  if (c & 0x0001) {
    digitalWrite(disp1_pin, HIGH);
  } else {
    digitalWrite(disp1_pin, LOW);
  }
  if (c & 0x0002) {
    digitalWrite(disp2_pin, HIGH);
  } else {
    digitalWrite(disp2_pin, LOW);
  }
  if (c & 0x0004) {
    digitalWrite(disp3_pin, HIGH);
  } else {
    digitalWrite(disp3_pin, LOW);
  }
    if (c & 0x0008) {
    digitalWrite(disp4_pin, HIGH);
  } else {
    digitalWrite(disp4_pin, LOW);
  }
}

// loop() -- main loop.
void loop() {
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
  }
  delay(100);
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
    digitalRead(ir3_pin) == LOW && digitalRead(ir3_pin) == LOW) return; 
  hit_time = micros();
  hit_count++;
  ready_for_hit = false;
}

