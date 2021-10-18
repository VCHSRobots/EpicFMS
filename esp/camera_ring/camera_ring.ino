// camera_ring.ino -- Code for a Trinket M0 to drive green LEDs for camera
// dlb, Oct 2021

#include <Adafruit_NeoPixel.h>

#define NEO_PIN     1 
#define CTRL_PIN    3
#define NPIXELS    16
#define LIGHTS_ON  HIGH
#define LIGHTS_OFF LOW
#define OUR_GREEN  0x0000FF00 
#define OUR_OFF    0x00000000

Adafruit_NeoPixel pixels(NPIXELS, NEO_PIN, NEO_GRB + NEO_KHZ800);

void setup() {
  pinMode(CTRL_PIN, INPUT_PULLUP);
  pixels.begin(); 
  set_lights(OUR_GREEN);
  delay(200);
}

int last_ctrl = LIGHTS_ON;
void loop() {
  int new_ctrl = digitalRead(CTRL_PIN);
  if(new_ctrl != last_ctrl) {
    last_ctrl = new_ctrl;
    if(new_ctrl == LIGHTS_ON) set_lights(OUR_GREEN);
    else                      set_lights(OUR_OFF);
  }
}

void set_lights(int color) {
  for(int i=0; i < NPIXELS; i++) {
    pixels.setPixelColor(i, color);  
  }
  pixels.show();
}

