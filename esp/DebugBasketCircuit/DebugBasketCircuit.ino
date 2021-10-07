
#include <Adafruit_NeoPixel.h>
#define PIN_NEO1   3  // D9/RX -- NEO Strip
#define PIN_NEO2   4
#define PIN_IRE1   13  // D7 -- IR Emitter 1
#define NPIXELS 42

Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NPIXELS, PIN_NEO1, NEO_RGB + NEO_KHZ800);
Adafruit_NeoPixel pixels2 = Adafruit_NeoPixel(NPIXELS, PIN_NEO2, NEO_RGB + NEO_KHZ800);

void show_color(int r, int g, int b) {
  for(int i = 0; i < NPIXELS; i++) {
    pixels1.setPixelColor(i, pixels1.Color(r, g, b));
    pixels2.setPixelColor(i, pixels1.Color(r, g, b));
  }
  pixels1.show();
  pixels2.show();
}

void setup() {
  delay(1000);
  Serial.begin(115200);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Basket Target.");
  Serial.println("Version 0.5, Oct 2021.");
  Serial.println(" ");
  pixels1.begin();
  pixels2.begin(); 

  pinMode(PIN_IRE1, OUTPUT);
  digitalWrite(PIN_IRE1, HIGH);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println("In Loop: red");
  show_color(128, 0, 0);
  delay(500);
  Serial.println("green");
  show_color(0,128,0);
  digitalWrite(PIN_IRE1, LOW);
  delay(500);
  Serial.println("blue");
  show_color(0, 0, 128);
  digitalWrite(PIN_IRE1, HIGH);
  delay(500);
}
