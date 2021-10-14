// epicfmswifi.h -- interface to Wifi for Epic Target Unit
// dlb, Oct 2021

#ifndef EPICFMS_WIFI
#define EPICFMS_WIFI

#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include "EpicFmsLib.h"

#define MAX_STATUS_CHARS 400
#define MAX_CMD_CHARS 200
#define MAXARGS 10
#define MAX_ARGNAME_CHARS 20
#define MAX_ARGVALUE_CHARS 20

typedef struct cmdargs {
  int ncount;
  char names[MAXARGS][MAX_ARGNAME_CHARS];
  char values[MAXARGS][MAX_ARGVALUE_CHARS];
} Cmdargs;

typedef void (*f_oncommand_t) (Cmdargs *args);
typedef void (*f_onstatus_t) (char *json);

class EpicFmsWiFi {
  public:
    EpicFmsWiFi(const char *ssid, const char *password, const char *welcome_msg);
    void begin(void);
    void update(void);
    void set_oncommand(f_oncommand_t func); // Sets the callback for getting a command.
    void set_onstatus(f_onstatus_t func); // Sets the callback for returning status.
    void debug_report(void);
    void set_hitcount(long hitcount); // Sets the hitcount for report to EpicFms server
    //void set_status_json(const char *json); // Sets status to be sent to EpicFms server
    //bool get_command(Cmdargs *args);  // returns True if new command, and copies args over
    bool is_connected(void); // Is currently connected
    bool infailure(void); // The server hasn't been connected for a period of time.

// Nothing private cause the static functions must see these:
    ESP8266WebServer *_server;
    bool _started = false;
    const char *_ssid;
    const char *_password;
    const char *_welcome_msg; 
    f_oncommand_t _oncommand; 
    f_onstatus_t _onstatus;
    long _hitcount = 0;
    char _status_json[MAX_STATUS_CHARS];
    char _cmd_json[MAX_CMD_CHARS];
    uint32_t _unconnected_time = 0;
    bool _waiting_for_connect = true;
    bool _failure_declared = false;
    Cmdargs _lastargs;
    long _ncommands = 0;
};

#endif
