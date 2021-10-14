// epicfmswifi.cpp -- interface to Wifi for Epic Target Unit
// dlb, Oct 2021

#include "epicfmswifi.h"
void handleRoot();
void handleMac();
void handleStatus();
void handleHits();
void handleCommand();
void handleShowCmd();

EpicFmsWiFi *g_this = NULL;  // The one allowed object for this class

// Constructor. 
EpicFmsWiFi::EpicFmsWiFi(const char *ssid, const char *password, const char *welcome_msg) {
  if (g_this) {
    Serial.println("Programming Error!!! Cannot create more than one EpicFmsWiFi objects.");
  }
  _started = false;
  _ssid = ssid;
  _password = password;
  _welcome_msg = welcome_msg;
  _oncommand = NULL;
  _onstatus = NULL;
  _hitcount = 0;
  g_this = this;
}

// Initalize the connection.
void EpicFmsWiFi::begin(void) {
   if (_started) return;
   _started = true;
   WiFi.mode(WIFI_STA);
   WiFi.begin(_ssid, _password);
   _waiting_for_connect = true;
   _unconnected_time = millis();
   _failure_declared = false;
  _server = new ESP8266WebServer(80);
  _server->on("/", handleRoot);
  _server->on("/mac", handleMac);
  _server->on("/status", handleStatus);
  _server->on("/hits", handleHits);
  _server->on("/command", handleCommand);
  _server->on("/showcmd", handleShowCmd);
  _server->begin();   
}

// Keeps the server running.  Should be called often, say once every 20ms.
void EpicFmsWiFi::update(void) {
  if(_waiting_for_connect) {
    if(WiFi.isConnected()) {
      _waiting_for_connect = false;
      _failure_declared = false;
    } else {
      if (!_failure_declared) {
        if (millis() - _unconnected_time > 5000) {
          _failure_declared = true;
        }
      }
    }
  } else { // Was connected in the past
    if(!WiFi.isConnected()) {
      _waiting_for_connect = true;  
      _unconnected_time = millis();
    } else {
      _failure_declared = false;  // because we are still connnected.
    }
  } 
  _server->handleClient();
}

void EpicFmsWiFi::set_oncommand(f_oncommand_t func) {
  _oncommand = func;
}

void EpicFmsWiFi::set_onstatus(f_onstatus_t func) {
  _onstatus = func;
}

// Sends debugging info to the terminal.
void EpicFmsWiFi::debug_report(void) {
  char lineout[120];
  char macadr[20];
  char ipadr[20];
  uint8_t mac[WL_MAC_ADDR_LENGTH];
  WiFi.macAddress(mac);
  sprintf(macadr, "%02x.%02x.%02x.%02x.%02x.%02x", mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
  if (WiFi.isConnected()) {
    uint8_t ipbytes[4];
    uint32_t ip4 = WiFi.localIP();
    memcpy(ipbytes, &ip4, 4);  
    sprintf(ipadr, "%d.%d.%d.%d", ipbytes[0], ipbytes[1], ipbytes[2], ipbytes[3]);
  }
  else sprintf(ipadr, "(not connected)");
  sprintf(lineout, "WebServer: MAC=%s, IP=%s, isconnected=%d, infailure=%d", 
    macadr, ipadr, is_connected(), _failure_declared );
  Serial.println(lineout);
}

// Sets the current hit count that will be sent to the server
// if the server asks for it.
void EpicFmsWiFi::set_hitcount(long hitcount) {
  _hitcount = hitcount;
}

// // Sets the current status that will be returned to the server 
// // if the server asks for it.
// void EpicFmsWiFi::set_status_json(const char *json) {
//   int n = strlen(json);
//   if (n >= MAX_STATUS_CHARS-1) n = MAX_STATUS_CHARS-1;
//   strncpy(_status_json, json, n);
//   _status_json[MAX_STATUS_CHARS - 1] = 0;
// }

// // Returns the argements of the last command recevied,
// // if any.  True is returned if a new command exists,
// // false otherwise.  
// bool EpicFmsWiFi::get_command(Cmdargs *args) {
//   memcpy(args, &g_this->_lastargs, sizeof(Cmdargs));
//   bool pending = g_this->_cmd_pending; 
//   g_this->_cmd_pending = false;
//   return pending;
// }

// Returns the connection status.
bool EpicFmsWiFi::is_connected(void) {
  return WiFi.isConnected();
}

// Returns the connection failure condition 
bool EpicFmsWiFi::infailure(void) {
  return _failure_declared;
}

void handleRoot() {
  char line[100];
  sprintf(line, g_this->_welcome_msg);
  g_this->_server->send(200, "text/plain", line);
}

void handleMac() {
  char line[100];
  char macadr[20];
  uint8_t mac[WL_MAC_ADDR_LENGTH];
  WiFi.macAddress(mac);
  sprintf(macadr, "%02x.%02x.%02x.%02x.%02x.%02x", mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
  sprintf(line, "Mac=%s", macadr);
  g_this->_server->send(200, "text/plain", line);
}

void handleStatus() {
  if(g_this->_onstatus == NULL) {
    char line[100];
    sprintf(line, "{\"status\" = \"Not implemented.\"}\n");
    g_this->_server->send(200, "text/plain", line);
    return;
  }
  g_this->_onstatus(g_this->_status_json);
  g_this->_server->send(200, "text/plain", g_this->_status_json);
}

void handleHits() {
  char line[100];
  sprintf(line, "{\"hits\" = %ld}", g_this->_hitcount);
  g_this->_server->send(200, "text/json", line);
}

void handleCommand() {
  if(g_this->_oncommand == NULL) {
    g_this->_server->send(200, "test/plain", "0> Commands not implmented.");
    return;
  }
  // This complicated code will copy the name/value pairs from the query string
  Cmdargs *c = &(g_this->_lastargs);
  c->ncount = g_this->_server->args();
  for(int i = 0; i < c->ncount; i++) {
    strncpy(c->names[i], g_this->_server->argName(i).c_str(), MAX_ARGNAME_CHARS);
    c->names[i][MAX_ARGNAME_CHARS-1] = 0;
    strncpy(c->values[i], g_this->_server->arg(i).c_str(), MAX_ARGVALUE_CHARS);
    c->values[i][MAX_ARGVALUE_CHARS-1] = 0;
  }
  g_this->_oncommand(c);
  char lineout[100];
  g_this->_ncommands++; // Keep track of the commands received, to give acknowledgement.
  sprintf(lineout, "1> Cmd received: %ld", g_this->_ncommands);
  g_this->_server->send(200, "text/plain", lineout);
}

void handleShowCmd() {
  char lineout[500];
  char line[100];
  strncpy(lineout, "<!DOCTYPE html><html><head><title>Basket Unit</title></head><body>\n", 500);
  Cmdargs *c = &(g_this->_lastargs);
  sprintf(line, "<br>Cmd #: %ld, nargs = %d<br><br>\n", g_this->_ncommands, c->ncount);
  strncat(lineout, line, 500);
  for(int i = 0; i < c->ncount; i++) {
    sprintf(line, "%s = %s<br>\n", c->names[i], c->values[i]);
    strncat(lineout, line, 500);
  }
  strncat(lineout, "</body></html>\n", 500);
  g_this->_server->send(200, "text/html", lineout);
}