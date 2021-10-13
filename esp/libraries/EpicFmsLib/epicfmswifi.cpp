// epicfmswifi.cpp -- interface to Wifi for Epic Target Unit
// dlb, Oct 2021

#include "epicfmswifi.h"

EpicFmsWiFi::EpicFmsWiFi(const char *ssid, const char *password) {
  _ssid = ssid;
  _password = password;
  _started = false;
  _hitcount = 0;
}

void EpicFmsWiFi::begin(void) {
  _started = true;

}

void EpicFmsWiFi::update(void) {
  //server.handleClient();
  // //MDNS.update();
}

