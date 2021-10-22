// slider_test.ino -- used to test and setup the slider targets.
// dlb, oct 2021

// This code tests version TWO/THREE of the PCB cards.
// In this code, NEO1 is reassigned to control the SERVO.

#include <Servo.h>

#define VOLTSPERLSB 0.00753 // Volts per bit on analog sensor for V-Battery

#define PW_CENTER 1500
#define PW_LEFT    800
#define PW_RIGHT  2300

#define PIN_NONE    -1  // Means no pin assigned.
#define PIN_HRST    16  // D0/G16 -- push button with pullup
#define PIN_SERVO    5  // D1/G5 -- NEO LEDs, via buffer
#define PIN_IRD2     4  // D2/G4 -- Takes over NEO2!
#define PIN_IRE4     0  // D3/G0 -- IR Emitter via buffer
#define PIN_IRE3     2  // D4/G2 -- IR Emitter via buffer
#define PIN_IRD4    14  // D5/G14 -- IR Detector via OpAmp
#define PIN_IRD3    12  // D6/G12 -- IR Detector via OpAmp
#define PIN_IRE2    13  // D7/G13 -- IR Emitter via butter
#define PIN_IRE1    15  // D8/G15 -- IR Emitter via buffer
#define PIN_IRD1    10  // SD3/G10 -- IR Detector via OpAmp
#define PIN_GMODE    9  // SD2/G9  -- Switch with pullup
#define NPIXELS 24

Servo servo;
uint32_t last_battery_udpate_time = millis();
float vbattery = 0.0;  // Voltage reading on battery -- updated once per 0.5 sec
volatile long count1 = 0;
volatile long count2 = 0;
volatile long count3 = 0;
volatile long count4 = 0;
volatile uint32_t last_dect_1_time = millis();
volatile uint32_t last_dect_2_time = millis();
volatile uint32_t last_dect_3_time = millis();
volatile uint32_t last_dect_4_time = millis();
long main_loop_count = 0;
int sw1 = LOW;
int sw2 = LOW;
int last_pos; 

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  delay(500);
  Serial.println("Startup. Test for PCB V2, Schematic 5, with Mods.");
  delay(500);
  Serial.println("Setting up servo.");
  servo.attach(PIN_SERVO, 600, 2400);
  servo.writeMicroseconds(PW_CENTER);

  pinMode(PIN_HRST, INPUT);
  pinMode(PIN_GMODE, INPUT);

  // Turn on all the emitters.
  pinMode(PIN_IRE1, OUTPUT);
  pinMode(PIN_IRE2, OUTPUT);
  pinMode(PIN_IRE3, OUTPUT);
  pinMode(PIN_IRE4, OUTPUT);
  digitalWrite(PIN_IRE1, HIGH);
  digitalWrite(PIN_IRE2, HIGH);
  digitalWrite(PIN_IRE3, HIGH);
  digitalWrite(PIN_IRE4, HIGH);

  // Turn on all detectors
  pinMode(PIN_IRD1, INPUT);
  pinMode(PIN_IRD2, INPUT);
  pinMode(PIN_IRD3, INPUT);
  pinMode(PIN_IRD4, INPUT);
  attachInterrupt(PIN_IRD1, isr_detector_1, RISING);
  attachInterrupt(PIN_IRD2, isr_detector_2, RISING);
  attachInterrupt(PIN_IRD3, isr_detector_3, RISING);
  attachInterrupt(PIN_IRD4, isr_detector_4, RISING);
}

void loop() {
  main_loop_count++;
  battery_update();
  sw1 = digitalRead(PIN_GMODE);
  sw2 = digitalRead(PIN_HRST);
  control_servo(sw1);
  report();
}

void control_servo(int pos) {
    if (pos == last_pos) return;
    last_pos = pos;
    if (pos == 0)  servo.writeMicroseconds(PW_LEFT);
    else           servo.writeMicroseconds(PW_RIGHT);
}

// Reads the Battery Voltage
void battery_update(void) {
  if (millis() - last_battery_udpate_time < 500) return;
  last_battery_udpate_time = millis();
  int ir = analogRead(A0);
  vbattery = ir * VOLTSPERLSB;
}

IRAM_ATTR void isr_detector_1() {
  uint32_t tnow = millis();
  if (tnow - last_dect_1_time < 60) return;
  last_dect_1_time = tnow;
  count1++;
}

IRAM_ATTR void isr_detector_2() {
  uint32_t tnow = millis();
  if (tnow - last_dect_2_time < 60) return;
  last_dect_2_time = tnow;
  count2++;
}

IRAM_ATTR void isr_detector_3() {
  uint32_t tnow = millis();
  if (tnow - last_dect_3_time < 60) return;
  last_dect_3_time = tnow;
  count3++;
}

IRAM_ATTR void isr_detector_4() {
  uint32_t tnow = millis();
  if (tnow - last_dect_4_time < 60) return;
  last_dect_4_time = tnow;
  count4++;
}

uint32_t last_report_time = millis();
void report() {
  uint32_t tnow = millis();
  if(tnow - last_report_time < 1500) return;
  last_report_time = tnow;
  char lineout[100];
  sprintf(lineout, "Main Loop Count = %ld, Battery = %6.1f volts", main_loop_count, vbattery);
  Serial.println(lineout);
  sprintf(lineout, "Sw1 = %s, Sw2 = %s", sw1 ? "High" : "Low", sw2 ? "High" : "Low");
  Serial.println(lineout);
  sprintf(lineout, "Counts = %6ld, %6ld, %6ld, %6ld ", count1, count2, count3, count4);
  Serial.println(lineout);
}

