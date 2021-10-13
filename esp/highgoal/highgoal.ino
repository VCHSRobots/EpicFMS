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
#include <EpicFmsLib.h>

#define BASKET_TARGET

#ifndef STASSID
//#define STASSID "BBHWiFiLink"
//#define STAPSK  "hockeypuck"
#define STASSID "epicfms"
#define STAPSK  "epic4fms"
#endif

ESP8266WebServer server(80);

// Special Setup for the Modified Basket Target running
// on a V1 of the PCB
#define PIN_NONE    -1  // Means no pin assigned.
#define PIN_NEO      4  // D2/G4 -- On NEO2 Header -- 
#define PIN_IRE     15  // 1  // D10/TX/G1 -- IR Emitter
#define PIN_GMODE    5  // D1/G5 -- On NEO1 Header --
#define PIN_PWM     13  // D7/G13 -- PWM via 74125 buffer
#define PIN_IRD     14  // D5/G14 -- IR Detector 
#define PIN_A       12  // D6/G12 -- Via OpAmp 
#define PIN_B       10  // SD3/G10 -- Direct input
#define NPIXELS 42

#define VOLTSPERLSB 0.013 // Volts per bit on analog sensor for V-Battery

#define SW_RUN LOW      // Defines how the switch is used, High=Run 
#define SW_OFFLINE HIGH // Defines how the switch is used, Low=offline  
#define SW_UNDEFINED -1 // Use when the condition of the switch is not known

const char* ssid = STASSID;
const char* password = STAPSK;

//ESP8266WebServer server(80);
NeoConductor neopixels = NeoConductor(PIN_NEO, PIN_NONE, NPIXELS, NPIXELS);
BasketMotor bmotor = BasketMotor(PIN_PWM, PIN_A, PIN_B);
HitDetector hitdetector = HitDetector(PIN_IRE, PIN_IRD);

char lineout[100];
unsigned long last_report_time = millis();
int mode = SW_OFFLINE; // Set by switch, updated on main loop.
int lastmode = SW_UNDEFINED;
float vbattery = 0.0;  // Voltage reading on battery -- updated once per 0.5 sec//
unsigned long last_battery_udpate_time = millis();
long report_count = 0;

void setup(void) {
  Serial.begin(115200);
  delay(500);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Basket Target.");
  Serial.println("Version 0.5, Oct 2021.");
  Serial.println(" ");

  Serial.println("Setting up Neo pixels.");
  neopixels.begin();
  neopixels.show_solidcolor(0, 128, 0);
 
  //Serial.println("HTTP server started");
  //server.begin();

  delay(100);
  Serial.println("Setting up the hit detector.");
  hitdetector.begin();

  Serial.println("Setting up Run Mode switch.");
  pinMode(PIN_GMODE, INPUT);

  Serial.println("Setting up motor.");
  bmotor.begin();
  bmotor.setrpm(25);
  bmotor.disable();

  Serial.println("Setup Done -- Starting Main Loop.");
}

// Reads the Battery Voltage
void battery_update(void) {
  if (millis() - last_battery_udpate_time < 500) return;
  last_battery_udpate_time = millis();
  int ir = analogRead(A0);
  vbattery = ir * VOLTSPERLSB;
}

// Here, we take over neo updated for debugging purposes
void update_neo() {
  bool hiterror = (hitdetector.get_status() == HDSTATUS_ERROR);
  bool stuck = bmotor.isstuck();
  bool jerking = bmotor.injam();
  long jamcount = bmotor.jamcount(); 
  long encoder_ticks = bmotor.encoderpos();
  long nrevs_ticks = (encoder_ticks >> 10) * 1024; 
  float revs = float(encoder_ticks - nrevs_ticks) / 1024.0;
  long hitcount = hitdetector.value();
  neopixels.show_basketstatus(hiterror, stuck, jerking, hitcount, jamcount, revs);
  // if (p) {
  //   char lineout[100];
  //   sprintf(lineout, "enc_ticks = %ld, nrevs_ticks = %ld, revs = %f", encoder_ticks, nrevs_ticks, revs);
  //   Serial.println(lineout);
  // }
}

// Reports status to terminal
void send_report(void) {
  if(millis() - last_report_time < 1000) return;
  last_report_time = millis();
  report_count++;
  Serial.println("");
  const char *swout;
  if (mode == SW_RUN) swout = "Run";
  else swout = "Offline";
  sprintf(lineout, "%ld ***** Battery Voltage=%6.1f, Mode=%s", report_count, vbattery, swout);
  Serial.println(lineout);
  bmotor.debug_report();
  hitdetector.debug_report();
}

void loop() {
  // //server.handleClient();
  // //MDNS.update();
  static int lastmode = SW_UNDEFINED;
  mode = digitalRead(PIN_GMODE);
  battery_update();
  bmotor.update();
  hitdetector.update();
  update_neo();
  send_report();
  if (mode != lastmode) {
    lastmode = mode;
    if (mode == SW_OFFLINE) {
        hitdetector.start_selftest(); // Start with clearing errors.
        if (vbattery > 8.0) bmotor.enable();  // Run the motor in offline.
    } else {
      bmotor.disable(); // For now.  Later, the server will take care of this.
    }
  }
}  

