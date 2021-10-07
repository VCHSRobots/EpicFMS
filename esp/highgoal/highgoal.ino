// gtdevice.ino -- sketch for a Game Target Device 
// Epic Robotz, dlb, Sept 2021

// This sketch is intended to run in a ESP8266 that resides in
// the High Goal, otherwise known as the basket target.

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
// NOTE -- This sketch runs on a MODIFIED V1 of the PCB
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
#define PIN_NC0    16  // D0 -- No Connection
#define PIN_GMODE   5  // D1 -- Switch: Mode to run in
#define PIN_NC1     4  // D2  
#define PIN_NC2     0  // D3 (Must be unconnected or high on boot)
#define PIN_NC3     2  // D4 (Must be unconnected or high on boot)
#define PIN_IRD1   14  // D5 -- IR Detector 1
#define PIN_NC4    12  // D6 
#define PIN_IRE1   13  // D7 -- IR Emitter 1
#define PIN_NC5    15  // D8 (Must be unconnected or low on boot)
#define PIN_NEO1    3  // D9/RX -- NEO Strip
#define PIN_PWM     1  // D10/TX -- PWM Output for Motor
#define PIN_A      10  // SD3 -- Encoder Input A
#define PIN_B       9  // SD2 -- Encoder Input B

#define NPIXELS 12

Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NPIXELS, PIN_NEO1, NEO_RGB + NEO_KHZ800);

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


  Serial.print("Starting WiFi.");
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  // Wait for connection
  int ibluecnt = 0;
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    ibluecnt++;
    set_blue_count(ibluecnt);
    Serial.print("x");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  if (MDNS.begin("esp8266")) {
    Serial.println("MDNS responder started");
  }

  server.on("/", handleRoot);

  server.on("/fms", handleFMS);

  server.on("/inline", []() {
    server.send(200, "text/plain", "this works as well");
  });

  server.onNotFound(handleNotFound);

  /////////////////////////////////////////////////////////
  // Hook examples

  server.addHook([](const String & method, const String & url, WiFiClient * client, ESP8266WebServer::ContentTypeFunction contentType) {
    (void)method;      // GET, PUT, ...
    (void)url;         // example: /root/myfile.html
    (void)client;      // the webserver tcp client connection
    (void)contentType; // contentType(".html") => "text/html"
    Serial.printf("A useless web hook has passed\n");
    Serial.printf("usr = %s\n",url.c_str());
    Serial.printf("(this hook is in 0x%08x area (401x=IRAM 402x=FLASH))\n", esp_get_program_counter());
    return ESP8266WebServer::CLIENT_REQUEST_CAN_CONTINUE;
  });

  server.addHook([](const String&, const String & url, WiFiClient*, ESP8266WebServer::ContentTypeFunction) {
    if (url.startsWith("/fail")) {
      Serial.printf("An always failing web hook has been triggered\n");
      return ESP8266WebServer::CLIENT_MUST_STOP;
    }
    return ESP8266WebServer::CLIENT_REQUEST_CAN_CONTINUE;
  });

  server.addHook([](const String&, const String & url, WiFiClient * client, ESP8266WebServer::ContentTypeFunction) {
    if (url.startsWith("/dump")) {
      Serial.printf("The dumper web hook is on the run\n");

      // Here the request is not interpreted, so we cannot for sure
      // swallow the exact amount matching the full request+content,
      // hence the tcp connection cannot be handled anymore by the
      // webserver.
#ifdef STREAMSEND_API
      // we are lucky
      client->sendAll(Serial, 500);
#else
      auto last = millis();
      while ((millis() - last) < 500) {
        char buf[32];
        size_t len = client->read((uint8_t*)buf, sizeof(buf));
        if (len > 0) {
          Serial.printf("(<%d> chars)", (int)len);
          Serial.write(buf, len);
          last = millis();
        }
      }
#endif
      // Two choices: return MUST STOP and webserver will close it
      //                       (we already have the example with '/fail' hook)
      // or                  IS GIVEN and webserver will forget it
      // trying with IS GIVEN and storing it on a dumb WiFiClient.
      // check the client connection: it should not immediately be closed
      // (make another '/dump' one to close the first)
      Serial.printf("\nTelling server to forget this connection\n");
      static WiFiClient forgetme = *client; // stop previous one if present and transfer client refcounter
      return ESP8266WebServer::CLIENT_IS_GIVEN;
    }
    return ESP8266WebServer::CLIENT_REQUEST_CAN_CONTINUE;
  });

  // Hook examples
  /////////////////////////////////////////////////////////

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
