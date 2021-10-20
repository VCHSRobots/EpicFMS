//  DebugBasketCircuit -- 
//  dlb, Oct 2021
//
// Simple test sketch to get the circuit working.
// Used for experimenting.  Current State = everything works!

#include <Adafruit_NeoPixel.h>
#include <Servo.h>
#define PIN_NEO     5  // D2/G4 -- On NEO2 Header -- 
#define PIN_IRE     1  // D10/TX/G1 -- IR Emitter
#define PIN_MODE    5  // D1/G5 -- On NEO1 Header --
#define PIN_PWM    13  // D7/G13 -- PWM via 74125 buffer
#define PIN_IRD    14  // D5/G14 -- IR Detector 
#define PIN_A      12  // D6/G12 -- Via OpAmp 
#define PIN_B      10  // SD3/G10 -- Direct input
#define NPIXELS 42

Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NPIXELS, PIN_NEO, NEO_RGB + NEO_KHZ800);
Servo servo;
char lineout[100];
long lastlooptime = millis();
long lastpossition = 0;
volatile long encoder_position = 0;
volatile long isrcnt = 0;
int ncnt;
int last_mode = -100;

void show_color(int r, int g, int b) {
  for(int i = 0; i < NPIXELS; i++) {
    pixels1.setPixelColor(i, pixels1.Color(r, g, b));
  }
  pixels1.show();
}

void show_one(int n) {
  for(int i = 0; i < NPIXELS; i++) {
    pixels1.setPixelColor(i, pixels1.Color(0,0,0));
  }
  n = n % NPIXELS;
  pixels1.setPixelColor(n, pixels1.Color(128, 0, 0));
  pixels1.show();
}

void setup() {
  delay(1000);
  Serial.begin(115200);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Basket Target.");
  Serial.println("Version 0.5, Oct 2021.");
  Serial.println(" ");
  pixels1.begin();
  show_color(0, 0, 128);
  delay(100);
}
//   //pinMode(PIN_IRE, OUTPUT);
//   //digitalWrite(PIN_IRE, HIGH);

//   pinMode(PIN_IRD, INPUT);
//   pinMode(PIN_MODE, INPUT);

//   pinMode(PIN_A, INPUT);
//   pinMode(PIN_B, INPUT);
//   attachInterrupt(PIN_A, isr_encoderA, CHANGE);
//   attachInterrupt(PIN_B, isr_encoderB, CHANGE);

//   servo.attach(PIN_PWM);
//   servo.writeMicroseconds(1500);  // This should be zero rotation.
// }

// ICACHE_RAM_ATTR void isr_encoderA() {
//   isrcnt++;
//   int a = digitalRead(PIN_A);
//   int b = digitalRead(PIN_B);
//   if (a == HIGH) {
//       if (b == LOW) encoder_position++;
//       else encoder_position--;
//   } else {
//       if (b == LOW) encoder_position--;
//       else encoder_position++;
//   }
// }

// ICACHE_RAM_ATTR void isr_encoderB() {
//   isrcnt++;
//   int a = digitalRead(PIN_A);
//   int b = digitalRead(PIN_B);
//   if (b == HIGH) {
//       if (a == HIGH) encoder_position++;
//       else encoder_position--;
//   } else {
//       if (a == LOW) encoder_position--;
//       else encoder_position++;
//   }
// }

//void loop() {
//   // put your main code here, to run repeatedly:
//   sprintf(lineout, "Encoder Position = %ld, %ld", encoder_position, isrcnt);
//   Serial.println(lineout);
//   Serial.println("Red");
//   show_color(128, 0, 0);
//   delay(500);
//   Serial.println("Green");
//   show_color(0,128,0);
//   delay(500);
//   if (digitalRead(PIN_MODE) == HIGH) {
//     Serial.println("Blue");
//     show_color(0, 0, 128);
//     delay(500);
//     servo.writeMicroseconds(1400);
//   } else {
//     servo.writeMicroseconds(1500);
//   }
//}

// void loop() {
//   if(millis() - lastlooptime < 50) return;
//   lastlooptime = millis();
//   if (lastpossition != encoder_position) {
//     lastpossition = encoder_position;
//     ncnt++;
//     if (last_mode == LOW) show_one(ncnt);
//   } 
//   int current_mode = digitalRead(PIN_MODE);
//   if (current_mode != last_mode) {
//     last_mode = current_mode;
//     if (digitalRead(PIN_MODE) == HIGH) {
//       show_color(0, 0, 128);
//       servo.writeMicroseconds(1500);
//     } else {
//       show_one(ncnt);
//       servo.writeMicroseconds(1400);
//     }
//   }
// }  

void loop() {
  delay(500);
  Serial.println("HI");
  show_color(255, 0, 0);
  delay(500);
  show_color(0, 255, 0);
  delay(500);
  show_color(0, 0, 255);
}
