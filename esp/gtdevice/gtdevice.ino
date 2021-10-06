// gtdevice.ino -- sketch for a Game Target Device 
// Epic Robotz, dlb, Sept 2021

// This sketch is intended to run in a ESP8266 that resides in
// a game element.  The intent is to make this code super simple and
// completely generic for all game elements -- so that all
// ESP8266s in the system run this same sketch.
//
// Different game elements need different commands and
// provide different sensors.  However, these differences
// are accounted for in the circuit that the ESP8266 is
// connected to.  This code provides the same commands
// across all elements -- its just that some parameters,
// commands, and data pairs will not apply to every instance.
//
// The protocol is built on top of HTTP GET requests.  Here
// is a list of urls and their function:
// 
//  "/" -- Returns "FMS Game Element, v?" where v? is the
//         version number of this software.
//  "/hits" -- Returns "xxxxx, xxxxx, xxxxx, xxxxx"  where
//         the xxxxx are the hit counts for targets being monitored
//         by this device.  Note, the hit counts only reset at
//         power up.  Not all hit counts are used for all game
//         elements, in which case they will read zero.
//  "/error" -- Returns "None" or a human readable message of
//         a problem.  If "/error?clear=true", then after the
//         response, the server attemps to clear the error.
//         This error message may orrignate in circuitry that
//         the ESP8266 is connected to.
//  "/set?lights=xxxx" -- Sets the lights (Neopixels) on the game 
//         piece, according to xxxx. The possible light conditions
//         are defined elsewhere.
//   "/set?target=xxxx" -- Sets the condition of the target
//         on the game piece.  The possible target settings
//         are defined elsewhere, and their meaning may vary
//         with the game piece connected to the ESP8266.
//
// The game configuration, and the idenity of game elements is
// controlled at the server which issues IP addresses via DCHP.
// That is, the server knows each ESP8266 mac addresses, and 
// can associate which ESP8266 is connected to which game piece.

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <Adafruit_NeoPixel.h>
#include <SPI.h>

#define MOVING_TARGET_UNIT
//#define SLIDER_TARGET_UNIT
//#define BASKET_UNIT

#ifndef STASSID
//#define STASSID "BBHWiFiLink"
//#define STAPSK  "hockeypuck"
#define STASSID "epicfms"
#define STAPSK  "epic4fms"
#endif

// Setup For MOVING TARGET UNIT PCB -- VERSION 1 of the PCB
#define PIN_NC0    16  // D0 -- No Connection
#define PIN_NEO1    5  // D1 -- Neo Pixel Strip 1
#define PIN_NEO2    4  // D2 -- Neo Pixel Strip 2
#define PIN_SERVO   4  // D2 -- On some devices, servo connected here
#define PIN_IRD4    0  // D3 -- IR Detector 4
#define PIN_IRD3    2  // D4 -- IR Detector 4
#define PIN_IRD2   14  // D5 -- IR Detector 4
#define PIN_IRD1   12  // D6 -- IR Detector 4
#define PIN_IRE4   13  // D7 -- IR Detector 4
#define PIN_IRE3   15  // D8 -- IR Detector 4
#define PIN_IRE2    3  // D9/RX -- IR Detector 4
#define PIN_IRE1    1  // D10/TX -- IR Detector 4
#define PIN_HRST   10  // SD3 -- Hit Reset Switch
#define PIN_GMODE   9  // SD2 -- Game Mode Switch

#define NPIXELS 12

Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NPIXELS, PIN_NEO1, NEO_RGB + NEO_KHZ800);
Adafruit_NeoPixel pixels2 = Adafruit_NeoPixel(NPIXELS, PIN_NEO2, NEO_RGB + NEO_KHZ800);

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
volatile long hit_count_time_m1 = millis();
volatile long hit_count_time_m2 = millis();

void setup(void) {
  Serial.begin(115200);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Moving Target.");
  Serial.println("Version 0.5, Sept 2021.");
  Serial.println("Starting WiFi.");
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
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

  server.on("/gif", []() {
    static const uint8_t gif[] PROGMEM = {
      0x47, 0x49, 0x46, 0x38, 0x37, 0x61, 0x10, 0x00, 0x10, 0x00, 0x80, 0x01,
      0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0x2c, 0x00, 0x00, 0x00, 0x00,
      0x10, 0x00, 0x10, 0x00, 0x00, 0x02, 0x19, 0x8c, 0x8f, 0xa9, 0xcb, 0x9d,
      0x00, 0x5f, 0x74, 0xb4, 0x56, 0xb0, 0xb0, 0xd2, 0xf2, 0x35, 0x1e, 0x4c,
      0x0c, 0x24, 0x5a, 0xe6, 0x89, 0xa6, 0x4d, 0x01, 0x00, 0x3b
    };
    char gif_colored[sizeof(gif)];
    memcpy_P(gif_colored, gif, sizeof(gif));
    // Set the background to a random set of colors
    gif_colored[16] = millis() % 256;
    gif_colored[17] = millis() % 256;
    gif_colored[18] = millis() % 256;
    server.send(200, "image/gif", gif_colored, sizeof(gif_colored));
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

  SPI.begin();
  Serial.println("SPI cmds started.");
  lastcmdtime = millis();

  pixels1.begin(); 
  pixels2.begin();
  change_color();
  Serial.println("Neo pixels Started.");


//  pinMode(PIN_IRD1, INPUT);
//  pinMode(PIN_IRD2, INPUT);
//  pinMode(PIN_IRD3, INPUT);
//  pinMode(PIN_IRD4, INPUT);
//  pinMode(PIN_IRE1, OUTPUT);
//  pinMode(PIN_IRE2, OUTPUT);
//  pinMode(PIN_IRE3, OUTPUT);
//  pinMode(PIN_IRE4, OUTPUT);
//  digitalWrite(PIN_IRE1, HIGH);
//  digitalWrite(PIN_IRE2, HIGH);
//  digitalWrite(PIN_IRE3, HIGH);
//  digitalWrite(PIN_IRE4, HIGH);
  Serial.println("IR Emitters and Detectors Setup.");
  
  Serial.println("Setting up Interrupts.");
  sprintf(lineout, "Interrupt GPIO = %d", PIN_GMODE);
  Serial.println(lineout);
  pinMode(PIN_GMODE, INPUT);
  attachInterrupt(PIN_GMODE, isr_counter_m1, FALLING);
  sprintf(lineout, "Interrupt GPIO = %d", PIN_HRST);
  Serial.println(lineout);
  pinMode(PIN_HRST, INPUT);
  attachInterrupt(PIN_HRST, isr_counter_m2, FALLING);
  show_pins();
}


ICACHE_RAM_ATTR void isr_counter_m1() {
  // Only count transistions from high to low, and after
  // suitable debouce time.
  if (millis() - hit_count_time_m1 < 50) return;
  if (digitalRead(PIN_GMODE) == HIGH) return;
  hit_count_time_m1 = millis();
  hit_count++;
}

ICACHE_RAM_ATTR void isr_counter_m2() {
  // Only count transistions from high to low, and after
  // suitable debouce time.
  if (millis() - hit_count_time_m2 < 50) return;
  if (digitalRead(PIN_HRST) == HIGH) return;
  hit_count_time_m2 = millis();
  hit_count++;
}

void send_spi_cmd() {
    memcpy(recbuf, "00000000", 8);
    Serial.println("Sending Cmd.");
    for (unsigned int i=0; i < sizeof cmdbuf; i++) {
      recbuf[i] = SPI.transfer(cmdbuf[i]);
      if (cmdbuf[i] == '\r') break;
    }
    sprintf(lineout, "Rec: %d %d %d %d %d %d %d %d", 
      recbuf[0], recbuf[1], recbuf[2], recbuf[3], 
      recbuf[4], recbuf[5], recbuf[6], recbuf[7]);
    Serial.println(lineout);
    sprintf(lineout, "Hit_Count = %ld", hit_count);
    Serial.println(lineout);
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
    sprintf(lineout, "Analog Reading = %d", ir);
    Serial.println(lineout);
    //sent_spi_cmd();
  }
}
