// epicfmswifi.h -- interface to Wifi for Epic Target Unit
// dlb, Oct 2021

#ifndef EPICFMS_WIFI
#define EPICFMS_WIFI

#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include "EpicFmsLib.h"

class EpicFmsWiFi {
  public:
    EpicFmsWiFi(const char *ssid, const char *password);
    void begin(void);
    void update(void);
    void debug_report(void);
    void set_hitcount(int hitcount); // Sets the hitcount for report to EpicFms server
    void set_status_json(char *json); // Sets status to be sent to EpicFms server
    const char *get_command(void);  // returns json containing command from EpicFms server
    bool is_connected(void);

  private:
    bool _started = false;
    const char *_ssid;
    const char *_password;
    long _hitcount = 0;
    //ESP8266WebServer _server(80);
};

#endif
