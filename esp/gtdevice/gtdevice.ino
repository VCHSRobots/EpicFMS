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

// !!!!!!!!!!!!!!!! TODO: the actual code needs to be writen!

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <Adafruit_NeoPixel.h>
#include <SPI.h>

#ifndef STASSID
#define STASSID "BBHWiFiLink"
#define STAPSK  "hockeypuck"
#endif

#define NEOPIN1 D1   // This should be D1 
#define NEOPIN2 D2   // This should be D2
//#define COUNTGPIO 0  // THis should be D3
//#define COUNTGPIO 2  // This should be D4
//#define COUNTGPIO 14   // THis should be D5
#define COUNTGPIO 12  // This should be D6

#define NPIXELS 6

Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NPIXELS, NEOPIN1, NEO_RGB + NEO_KHZ800);
Adafruit_NeoPixel pixels2 = Adafruit_NeoPixel(NPIXELS, NEOPIN2, NEO_RGB + NEO_KHZ800);

volatile long hit_count = 0;

const char* ssid = STASSID;
const char* password = STAPSK;

ESP8266WebServer server(80);
char cmdbuf[30] = "EpicFMS Cmd\r";
char recbuf[30];
char lineout[100];
long lastcmdtime = 0;
long cmdcount = 0;

const int led = 13;
int cnt = 0;

void setup(void) {
  pinMode(led, OUTPUT);
  digitalWrite(led, 0);
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

  Serial.println("Setting up Interrupt.");
  sprintf(lineout, "Interrupt GPIO = %d", COUNTGPIO);
  Serial.println(lineout);
  pinMode(COUNTGPIO, INPUT);
  attachInterrupt(COUNTGPIO, isr_counter, RISING);
  //show_pins();
}


long last_hit_count = 0;
ICACHE_RAM_ATTR void isr_counter() {
  hit_count++;
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
    cmdcount++;
  }
}
