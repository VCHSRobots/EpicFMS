// pcb_tests_v5.ino -- testing v5 of pcb
// dlb, oct 2021

// This code tests version TWO of the pcb
// that is based on schematic V5.
//
// WITH the following modifications:
//  ** IRD_1 is rerouted to SD3. D10 is now unconnected/
//  ** IRD_2 is rerouted to D2.  D9 is now unconnected.
//  ** HITRST is rerouted to D0.  
// 
// This rework allows D9 and D10 to be completely 
// dedicated to TX and RX, which makes debugging a lot
// easier, and doesn't cause problems during flashing.
//
// Unfortuately, this means that the second NEO port
// is shared with IRD_2.  Only one or the other may
// be used at the same time.
//
// It also may mean that HITRST cannot be LOW on bootup.


#include <Adafruit_NeoPixel.h>

#define VOLTSPERLSB 0.00753 // Volts per bit on analog sensor for V-Battery

#define NEOMODE_SOLID      0
#define NEOMODE_ALTERNATE  1
#define NEOMODE_RUN        2
#define NEOMODE_SHOWCOUNTS 3

#define C_RED    0x00ff0000ul
#define C_GREEN  0x0000ff00ul
#define C_BLUE   0x000000fful
#define C_BLACK  0x00000000ul
#define C_YELLOW 0x00c0c000ul
#define C_WHITE  0x00fffffful

#define PIN_NONE    -1  // Means no pin assigned.
#define PIN_HRST    16  // D0/G16 -- push button with pullup
#define PIN_NEO1     5  // D1/G5 -- NEO LEDs, via buffer
#define PIN_NEO2     4  // D2/G4 -- Shared!
#define PIN_IRD2     4  // D2/G4 -- Shared!
#define PIN_IRE4     0  // D3/G0 -- IR Emitter via buffer
#define PIN_IRE3     2  // D4/G2 -- IR Emitter via buffer
#define PIN_IRD4    14  // D5/G14 -- IR Detector via OpAmp
#define PIN_IRD3    12  // D6/G12 -- IR Detector via OpAmp
#define PIN_IRE2    13  // D7/G13 -- IR Emitter via butter
#define PIN_IRE1    15  // D8/G15 -- IR Emitter via buffer
#define PIN_IRD1    10  // SD3/G10 -- IR Detector via OpAmp
#define PIN_GMODE    9  // SD2/G9  -- Switch with pullup
#define NPIXELS 24

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NPIXELS, PIN_NEO1, NEO_GRB + NEO_KHZ800);
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

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  delay(500);
  Serial.println("Startup. Test for PCB V2, Schematic 5, with Mods.");
  delay(500);
  pixels.begin();
  show_color(0x00808080); // White at 1/2 brightness
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
  if (sw1 == HIGH) {
    if (sw2 == HIGH) neo_control(NEOMODE_SOLID, C_GREEN, C_BLACK);
    else             neo_control(NEOMODE_RUN, C_WHITE, C_RED);
  } else {
    if (sw2 == HIGH) neo_control(NEOMODE_RUN, C_BLUE, C_BLACK);
    else             neo_control(NEOMODE_SHOWCOUNTS, C_BLACK, C_BLACK);
  }
  report();
}

void show_color(uint32_t c) {
  for (int i = 0; i < NPIXELS; i++) {
    pixels.setPixelColor(i, c);
  }
  pixels.show();
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


uint32_t last_neo_time = millis();
int neo_side_count = 0;
uint32_t neo_delay = 0;
int last_neo_mode = -1;
uint32_t last_neo_c1 = -1;
uint32_t last_neo_c2 = -1;
void neo_control(int mode, uint32 c1, uint32 c2) {
  uint32_t tnow = millis();
  if(tnow - last_neo_time < neo_delay) {
    if (last_neo_mode == mode && last_neo_c1 == c1 && last_neo_c2 == c2) return;
    last_neo_mode = mode;
    last_neo_c1 = c1;
    last_neo_c2 = c2;
  }
  last_neo_time = tnow;
  if (mode == NEOMODE_SOLID) {  // Solid Color
    show_color(c1);
    neo_delay = 200;
  }
  if (mode == NEOMODE_ALTERNATE) {
    // Alternating solid colors.
    neo_side_count++;
    if(neo_side_count > 1) {
      show_color(c1);
      neo_side_count = 0; 
    } else {
      show_color(c2);
    }
    neo_delay = 100;
    return;
  }
  if (mode == NEOMODE_RUN) {
    neo_side_count++;
    if (neo_side_count >= NPIXELS) neo_side_count = 0;
    for(int i = 0; i < NPIXELS; i++) pixels.setPixelColor(i, c2);
    pixels.setPixelColor(neo_side_count, c1);
    pixels.show();
    neo_delay = 50;
    return;
  }
  if (mode == NEOMODE_SHOWCOUNTS) {
    for(int i = 0; i < NPIXELS; i++) pixels.setPixelColor(i, C_BLACK);    
    for (int idect = 0; idect < 4; idect++) {
      int np = NPIXELS / 4;
      int ip0 = idect * np;
      int cnt = 0;
      int c = 0;
      switch (idect) {
        case 0: cnt = count1; c = C_RED; break;
        case 1: cnt = count2; c = C_GREEN; break;
        case 2: cnt = count3; c = C_BLUE; break;
        case 3: cnt = count4; c = C_YELLOW; break;
      }
      int n = cnt % np;
      for (int i = 0; i < n; i++) pixels.setPixelColor(i + ip0, c);
    }
    pixels.show();
  }
}
