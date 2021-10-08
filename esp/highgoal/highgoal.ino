// highgoal.ino -- Sketch for a High Goal Target (Baseket Target)
// Epic Robotz, dlb, Oct 2021

// This sketch is intended to run in a ESP8266 that resides in
// the High Goal, otherwise known as the Basket Target.

// Note, this game piece is not wired like the others, and the
// circuit as been altered to do different things, mainly to
// control the motor, and sense if the motor is operating 
// correctly.  That is, this code does the following:
//
//  1. Counts balls, with ONE IR beam
//  2. Provides PWM to control the speed of the mixer motor
//  3. Reads a quadurature encoder to sense speed of the motor
//  4. Controls ONE strip of Neo Pixels
//  5. Reads the outside battery voltage
//  6. Communicates with the EpicFMS server to give status
//     and take directions for a whole host of parameters.
//
// NOTE -- This sketch runs on a MODIFIED V1 of the PCB for the
// Moving Target Unit.  Beware!!


#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <Adafruit_NeoPixel.h>

#define BASKET_TARGET

#ifndef STASSID
//#define STASSID "BBHWiFiLink"
//#define STAPSK  "hockeypuck"
#define STASSID "epicfms"
#define STAPSK  "epic4fms"
#endif

// Special Setup for the Modified Basket Target running
// on a V1 of the PCB
#define PIN_NEO     4  // D2/G4 -- On NEO2 Header -- 
#define PIN_IRE     1  // D10/TX/G1 -- IR Emitter
#define PIN_MODE    5  // D1/G5 -- On NEO1 Header --
#define PIN_PWM    13  // D7/G13 -- PWM via 74125 buffer
#define PIN_IRD    14  // D5/G14 -- IR Detector 
#define PIN_A      12  // D6/G12 -- Via OpAmp 
#define PIN_B      10  // SD3/G10 -- Direct input
#define NPIXELS 42

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NPIXELS, PIN_NEO, NEO_RGB + NEO_KHZ800);

const char* ssid = STASSID;
const char* password = STAPSK;

ESP8266WebServer server(80);
char cmdbuf[30] = "EpicFMS Cmd\r";
char recbuf[30];
char lineout[100];
long lastcmdtime = 0;
long cmdcount = 0;
int cnt = 0;
volatile long hit_count = 0;
volatile long last_hit_count = 0;
volatile long hit_count_time = millis();
volatile long encoder_position = 0;

void setup(void) {
  Serial.begin(115200);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Basket Target.");
  Serial.println("Version 0.5, Oct 2021.");
  Serial.println(" ");

  Serial.println("Setting up Neo pixels.");
  //pixels1.begin(); 
  //set_blue_count(10);




  server.begin();
  Serial.println("HTTP server started");

  Serial.println("?Setting up IR Emitter and Detector.");
  pinMode(PIN_IRD1, INPUT);
  pinMode(PIN_IRE1, OUTPUT);
  digitalWrite(PIN_IRE1, HIGH);  // Turn on IR Beam.
  attachInterrupt(PIN_IRE1, isr_irbeam, FALLING);

  Serial.println("Setting up Run Mode switch.");
  pinMode(PIN_GMODE, INPUT);
  
  Serial.println("Setting up Interrupts for encoder.");
  pinMode(PIN_A, INPUT);
  pinMode(PIN_B, INPUT);
  attachInterrupt(PIN_A, isr_encoderA, CHANGE);
  attachInterrupt(PIN_A, isr_encoderB, CHANGE);

  Serial.println("Setting up PWM for motor.");
  pinMode(PIN_PWM, OUTPUT);
  digitalWrite(PIN_PWM, LOW);
}

ICACHE_RAM_ATTR void isr_irbeam() {
  if (millis() - hit_count_time < 50) return;
  if (digitalRead(PIN_GMODE) == HIGH) return;
  hit_count_time = millis();
  hit_count++;
}

ICACHE_RAM_ATTR void isr_encoderA() {
  int a = digitalRead(PIN_A);
  int b = digitalRead(PIN_B);
  if (a == HIGH) {
      if (b == LOW) encoder_position++;
      else encoder_position--;
  } else {
      if (b == LOW) encoder_position--;
      else encoder_position++;
  }
}

ICACHE_RAM_ATTR void isr_encoderB() {
  int a = digitalRead(PIN_A);
  int b = digitalRead(PIN_B);
  if (b == HIGH) {
      if (a == HIGH) encoder_position++;
      else encoder_position--;
  } else {
      if (a == LOW) encoder_position--;
      else encoder_position++;
  }
}

void loop(void) {
  server.handleClient();
  MDNS.update();
  if (last_hit_count != hit_count) {
    last_hit_count = hit_count;
    change_color();
  }
  if (millis() - lastcmdtime > 2000) {
    lastcmdtime = millis();
    cmdcount++;
    int ir = analogRead(A0);
    int gm = digitalRead(PIN_GMODE);
    sprintf(lineout, "Analog Reading = %d, Encoder Pos = %ld, GMode=%d", ir, encoder_position, gm);
    Serial.println(lineout);
  }
}
