// neo_conductor.cpp -- A class to manage two strips of Neo Pixels
// for the EpicFMS devices
// dlb, Oct 2021
//

// Note: for the white Neo Pixel strips the red/green/blue order is mixed up.
// IT is actually green/red/blue.  This cold rearranges the inputs to make things right.

#include "neo_conductor.h"
#include "EpicFmsLib.h"

NeoConductor::NeoConductor(int neopin1, int neopin2, int npixels1, int npixels2) {
    _neopin1 = neopin1;
    _neopin2 = neopin2;
    _npixels1 = npixels1;
    _npixels2 = npixels2;
}

#include <Adafruit_NeoPixel.h>


//define all constants for events
#define GMODE_NONE 0
#define GMODE_PWRUP 1
#define GMODE_UNITERR 2
#define GMODE_WAITFORWIFI 3 
#define GMODE_PRACTICE 4
#define GMODE_STANDBY 5
#define GMODE_MATCHCOUNTDOWN 6
#define GMODE_AUTO 7
#define GMODE_TELEOP 8
#define GMODE_MATCHFINAL 9
#define GMODE_POSTWAIT 10
#define GMODE_POSTRESULT 11
#define GMODE_FMSERROR 12
#define GMODE_FMSLOST 13


char lineout[100];
long timer = millis();
int iled1 = 0;
int iled2 = 0;
long errorCondition = 0;
int dance = 0;
int brightness = 150;
int reverse_lights = 0;

Adafruit_NeoPixel strip1(LED_COUNT1, LED_PIN1, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip2(LED_COUNT2, LED_PIN2, NEO_GRB + NEO_KHZ800);

void setup() {
  strip1.begin();           // INITIALIZE NeoPixel strip object (REQUIRED)
  strip1.show();            // Turn OFF all pixels ASAP
  strip1.setBrightness(brightness); // Set BRIGHTNESS to about 1/5 (max = 255)
  strip2.begin();           // INITIALIZE NeoPixel strip object (REQUIRED)
  strip2.show();            // Turn OFF all pixels ASAP
  strip2.setBrightness(brightness); // Set BRIGHTNESS to about 1/5 (max = 255)
  pinMode(INPUT_BUTTON, INPUT_PULLUP);
}

void set_all_pixels1(int r, int g, int b){
  for(int i=0; i<12; i++){
  if(_use1) strip1.setPixelColor(i,strip1.Color(g, r, b));
  if(_use1) strip1.show();
  }
 if(_use1) strip1.show();
 if(_use1) strip1.setBrightness(brightness);
}

void set_all_pixels2(int r, int g, int b){
  for(int i=0; i<12; i++){
  if(_use2) strip2.setPixelColor(i,strip1.Color(g, r, b));
  if(_use2) strip2.show();
  }
 if(_use2) strip2.show();
 if(_use2) strip2.setBrightness(brightness);
}
//all events

void led_error(){
strip1.setBrightness(150);
 strip2.setBrightness(150);
    if (millis() - timer <= 500) return; 
   timer = millis();
   if (errorCondition == 0){
    errorCondition = 1;
    set_all_pixels1(0, 0, 255);
    set_all_pixels2(255, 0, 0);
   }
   else{
    set_all_pixels1(255, 0, 0);
    set_all_pixels2(0, 0, 255);
    errorCondition = 0;
   }
}

void led_not_ready(){
 strip1.setBrightness(150);
 strip2.setBrightness(150);
   if (millis() - timer >= 50){
    timer = millis();
    set_all_pixels1(0, 0, 0);
    set_all_pixels2(0, 0, 0);
    strip1.show();
    strip2.show();
    iled1++;
     if (iled1 >= LED_COUNT1){
      iled1 = 0;
     }
     if (iled2 >= LED_COUNT2){
      iled2 = 0;
     }
     strip1.setPixelColor(iled1,strip1.Color(255, 0, 0));
     strip2.setPixelColor(iled1,strip2.Color(255, 0, 0));
     strip1.show();
     strip2.show();
 }
}

void led_standby(){
strip1.setBrightness(150);
 strip2.setBrightness(150);
   if (millis() - timer >= 50){
    timer = millis();
    set_all_pixels1(0, 0, 0);
    set_all_pixels2(0, 0, 0);
    strip1.show();
    strip2.show();
    iled1++;
     if (iled1 >= LED_COUNT1){
      iled1 = 0;
     }
     if (iled2 >= LED_COUNT2){
      iled2 = 0;
     }
     strip1.setPixelColor(iled1,strip1.Color(0, 255, 0));
     strip2.setPixelColor(iled1,strip2.Color(0, 255, 0));
     strip1.show();
     strip2.show();
 }
}

void led_countdown(){
 strip1.setBrightness(150);
 strip2.setBrightness(150);
   if (millis() - timer <=1000){
     set_all_pixels1(255, 0, 0);
     set_all_pixels2(255, 0, 0);
     strip1.show();
     strip2.show();
   }
   if (millis() - timer <=2000){
    if (millis() - timer >1000){
     set_all_pixels1(255, 255, 0);
     set_all_pixels2(155, 255, 0);
     strip1.show();
     strip2.show();
   }
  }
   if (millis() - timer <=3000){
    if (millis() - timer >2000){
     set_all_pixels1(0, 0, 255);
     set_all_pixels2(0, 0, 255);
     strip1.show();
     strip2.show();
   }
  }
     if (millis() - timer <=4000){
    if (millis() - timer >3000){
     set_all_pixels1(0, 255, 0);
     set_all_pixels2(0, 255, 0);
     strip1.show();
     strip2.show();
   }
  }
}

void led_auto_mode(){
 strip1.setBrightness(150);
 strip2.setBrightness(150);
if (millis() - timer <= 500) return; 
   timer = millis();
   if (dance == 0){
    dance = 1;
    set_all_pixels1(0, 255, 0);
    set_all_pixels2(252, 15, 192);
   }
   else{
    set_all_pixels1(252, 15, 192);
    set_all_pixels2(0, 255, 0);
    dance = 0;
   }
}

void led_score(){
  strip1.setBrightness(150);
 strip2.setBrightness(150);
 set_all_pixels1(255, 255, 255);
 set_all_pixels2(155, 255, 255);
 strip1.show();
 strip2.show();
}

void led_teleop(){
strip1.setBrightness(150);
 strip2.setBrightness(150);
     if (millis() - timer >= 50){
    timer = millis();
    set_all_pixels1(0, 0, 0);
    set_all_pixels2(0, 0, 0);
    strip1.show();
    strip2.show();
    iled1++;
     if (iled1 >= LED_COUNT1){
      iled1 = 0;
     }
     if (iled2 >= LED_COUNT2){
      iled2 = 0;
     }
     strip1.setPixelColor(iled1,strip1.Color(0, 0, 255));
     strip2.setPixelColor(iled1,strip2.Color(0, 0, 255));
     strip1.show();
     strip2.show();
 }
}

void led_end_game(){
 strip1.setBrightness(150);
 strip2.setBrightness(150);
       if (millis() - timer <= 100) return; 
   timer = millis();
   if (dance == 0){
    dance = 1;
    set_all_pixels1(random(), random(), random());
    set_all_pixels2(random(), random(), random());
   }
   else{
    set_all_pixels1(random(), random(), random());
    set_all_pixels2(random(), random(), random());
    dance = 0;
   } 
}

void led_gameover(){
  set_all_pixels1( 0, 255, 0);
  set_all_pixels2( 0, 255, 0);
  if (millis()-timer >=2){
   if (reverse_lights == 0) brightness--;
   if (reverse_lights == 1) brightness++;
   if (brightness >=100) reverse_lights = 0;
   if (brightness <= 0) reverse_lights = 1;
  }
}

void led_WFW(){
  set_all_pixels1( 150, 255, 0);
  set_all_pixels2( 150, 255, 0);
  if (millis()-timer >=300){
   if (reverse_lights  == 0) brightness -=33;
   if (reverse_lights == 1) brightness +=33;
 brightness + ;
   if (brightness >=100) reverse_lights = 0;
   if (brightness <= 0) reverse_lights = 1;
  }
}
void led_prac(){
strip1.setBrightness(150);
 strip2.setBrightness(150);
    if (millis() - timer <= 500) return; 
   timer = millis();
   if (errorCondition == 0){
    errorCondition = 1;
    set_all_pixels1(150, 255, 0);
    set_all_pixels2(0, 255, 0);
   }
   else{
    set_all_pixels1(0, 255, 0);
    set_all_pixels2(150, 255, 0);
    errorCondition = 0;
   }
}

void led_end_game(){
 strip1.setBrightness(150);
 strip2.setBrightness(150);
       if (millis() - timer <= 100) return; 
   timer = millis();
   if (dance == 0){
    dance = 1;
    set_all_pixels1(255, 0, 200);
    set_all_pixels2(255, 200, 0;
   }
   else{
    set_all_pixels1(255, 200, 0;
    set_all_pixels2(255, 0, 200);
    dance = 0;
   } 
}

//The calling of events to lights
void led_manager(int mode){
 switch(mode){
    case GMODE_NONE:  led_score(); break;
    case GMODE_PWRUP: led_not_ready(); break;
    case GMODE_UNITERR: led_standby(); break;
    case GMODE_WAITFORWIFI: led_WFW(); break;
    case GMODE_PRACTICE: led_prac(); break;
    case GMODE_MATCHCOUNTDOWN: led_countdown(); break;
    case GMODE_STANDBY:
    case GMODE_AUTO: led_auto_mode(); break;
    case GMODE_TELEOP: led_teleop(); break;
    case GMODE_MATCHFINAL: led_end_game(); break;
    case GMODE_POSTWAIT: led_gameover(); break;
0   case GMODE_POSTRESULT:
    case GMODE_FMSERROR: led_error(); break;
    case GMODE_FMSLOST:
 }
}

//The following is test code

void NeoConductor::begin(void) {
   if(digitalRead(INPUT_BUTTON) == HIGH){
    led_manager(MODE_COUNTDOWN);
   }else{
    led_manager(MODE_AUTO_MODE);
   }
}