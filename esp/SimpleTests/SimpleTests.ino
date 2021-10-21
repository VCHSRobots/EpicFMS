// SimpleTest.ino -- Discovery of how EPS8266 really works.
//
// Here is what is known:  
//  1. DO NOT USE the "D" numbers such as D0, D1, etc when specifing pins.
//  2. Pins seem to always be specified with the G numbers... 
//  3. If you want a serial port to upload code and debug, 
//     DO NOT USE D9 and D10 for any circuirty.
//  4. D0/G16 is connected to the on-board LED.  
//  5. D0/G16 cannot be used for PWM or Interrupts!
//  6. D0/G16 cannot be used for NEO pixels!
//  7. D0/G16 can be used to turn on/off a simple LED
//  8. D1, D2, D3, D4, D5, D6, D7, D8, and SS3 all work with interrupts.

#include <Adafruit_NeoPixel.h>
#define INR_PIN  5 // D1/G5
//#define NEO_PIN 16 // D0/G16 ** This doesn't work
//#define NEO_PIN  4 // D2/G4  ** This works fine
#define NEO_PIN 10  //SD3/G10  ** This works fine
#define LED_PIN 16 // D0/G16
#define NPIXELS 10 

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NPIXELS, NEO_PIN, NEO_GRB + NEO_KHZ800);
char lineout[100];

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  delay(500);
  Serial.println("Starting Up.");
  delay(500);
  pixels.begin();
  show_color(255, 0, 0);
  pinMode(LED_PIN, OUTPUT);
  pinMode(INR_PIN, INPUT_PULLUP);
  attachInterrupt(INR_PIN, isr_count, CHANGE);
}

volatile long count = 0;
void loop() {
  sprintf(lineout, "Count = %ld", count);
  Serial.println(lineout);
  digitalWrite(LED_PIN, HIGH);
  //show_color(255, 0, 0);
  show_packed_color(0x00ff0000); // Should be red
  delay(500);
  digitalWrite(LED_PIN, LOW);
  //show_color(0, 255, 0);
  show_packed_color(0x0000ff00); // Should be green
  delay(500);
  //show_color(0, 0, 255);
  show_packed_color(0x000000ff); // Should be blue
  delay(500);
  //show_color(0, 0, 0);
  show_packed_color(0x00000000); // Off, so that we know when the rgb sequence starts
  delay(200);
}

void show_color(int r, int g, int b) {
  for (int i = 0; i < NPIXELS; i++) {
    pixels.setPixelColor(i, pixels.Color(r, g, b));
  }
  pixels.show();
}

void show_packed_color(uint32_t c) {
  for (int i = 0; i < NPIXELS; i++) {
    pixels.setPixelColor(i, c);
  }
  pixels.show();
}

IRAM_ATTR void isr_count() {
  count++;
}

