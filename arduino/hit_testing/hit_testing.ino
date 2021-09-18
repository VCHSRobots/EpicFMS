// hit_testing.ino -- Tests the IR Beams for detection
// Epic Robotz, dlb, Sept 2021

volatile unsigned long hit_count = 0;
volatile unsigned long hit_time = 0;
volatile bool ready_for_hit = true;
const int ir_pin = 7;
const int led1_pin = 3;
const int led2_pin = 4;
const int led3_pin = 5;

void setup() {
  pinMode(led1_pin, OUTPUT);
  pinMode(led2_pin, OUTPUT);
  pinMode(led3_pin, OUTPUT);
  attachInterrupt(digitalPinToInterrupt(ir_pin), hit_count_isr, RISING);

  PCICR |= 4;    // Turns on PCINT[23:16] (all 8 pins)
  PCMSK2 = 0x80; // With above, turns on interrupt Change for pin D7 only.
}

void writeCount(int c) {
  if (c & 0x0001) {
    digitalWrite(led1_pin, HIGH);
  } else {
    digitalWrite(led1_pin, LOW);
  }
  if (c & 0x0002) {
    digitalWrite(led2_pin, HIGH);
  } else {
    digitalWrite(led2_pin, LOW);
  }
  if (c & 0x0004) {
    digitalWrite(led3_pin, HIGH);
  } else {
    digitalWrite(led3_pin, LOW);
  }
}

void hit_count_isr() {
  if (!ready_for_hit) return;
  hit_time = micros();
  hit_count++;
  ready_for_hit = false;
}

ISR(PCINT2_vect) {
  if (digitalRead(ir_pin)) hit_count_isr();
}

void blink() {
  for(; 1; ) {
    delay(100);
    digitalWrite(led3_pin, HIGH);
    delay(100);
    digitalWrite(led3_pin, LOW);
  }
}

void loop() {
  if (!ready_for_hit) {
    if (micros() - hit_time > 20000) {
      ready_for_hit = true;
    }
  }
  writeCount(hit_count);
}
