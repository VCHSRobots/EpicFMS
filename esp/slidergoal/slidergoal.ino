// slidergoal.ino -- Sketch for a Slider Goal 
// Epic Robotz, dlb, Oct 2021
//
// *** WIFI Version of Slider Goal ***
//
// This sketch is intended to run in a ESP8266 mounted on a
// V2 version of the PCB that has been modified to to the V3
// circuit. Please see PCB_Log.md for more information about
// V3.
//
// A Slider Goal has 4 IR beam sensors each with an individual
// IR emitter and an IR detector.  It also has a servo that
// opens and shuts a sliding door. 
//
// This code does the following:
//
//  1. Counts balls, with the combined 4 IR beams
//  2. Provides PWM to control the position of the door via the servo.
//  5. Reads the outside battery voltage
//  6. Communicates with the EpicFMS server to give status
//     and take directions for a whole host of parameters.
//
// One feature of this code is that the calibration settings for
// open and close are contained in EEPROM and can be set 
// over the air with commands from EpicFMS.

// Since the Slider Target does not have NEO leds attached, the
// on board LED is used to indicate status:
//
//   Fast Blink = Error in IR Detectors
//   Slow Blink = Waiting for WiFi 
//   ON         = Connected, no error
//   Off        = Undefined -- probably programming error.

#include <Arduino.h>
#include <EpicFmsLib.h>
#include <EEPROM.h>
#include <servo.h>

#define WIFISSID "epicfms"
#define WIFIPK  "epic4fms"

// Setup for V3 of the PCB:
#define PIN_NONE    -1  // Means no pin assigned.
#define PIN_HRST    16  // D0/G16 -- push button with pullup
#define PIN_SERVO    5  // D1/G5 -- Servo PWM
#define PIN_IRD2     4  // D2/G4 -- Takes over NEO2!
#define PIN_IRE4     0  // D3/G0 -- IR Emitter via buffer
#define PIN_IRE3     2  // D4/G2 -- IR Emitter via buffer
#define PIN_IRD4    14  // D5/G14 -- IR Detector via OpAmp
#define PIN_IRD3    12  // D6/G12 -- IR Detector via OpAmp
#define PIN_IRE2    13  // D7/G13 -- IR Emitter via butter
#define PIN_IRE1    15  // D8/G15 -- IR Emitter via buffer
#define PIN_IRD1    10  // SD3/G10 -- IR Detector via OpAmp
#define PIN_GMODE    9  // SD2/G9  -- Switch with pullup

// Definations for On-board LED.  Note that this
// conflicts with PIN_HRST.  Do not use PIN_HRST on the
// slider!!
#define PIN_ONBOARDLED 16
#define LED_OFF HIGH
#define LED_ON LOW

// Define Servo parameters
#define PW_CLOSE   1700   // Default PW for closed
#define PW_OPEN    1300   // Default PW for opened
#define PW_CENTER  1500   // Known approx center
#define SLIDER_CLOSED    0   // Slider set for door closed
#define SLIDER_CENTER    1   // Slider set for center (used for calibration)
#define SLIDER_OPEN      2   // Slider set for door opened
#define SLIDER_UNKNOWN  -1   // Indicates slider in an unknown condition

// Battery parameters
#define VOLTSPERLSB 0.013 // Volts per bit on analog sensor for V-Battery

// Switch parameters -- not currently used but kept for future
#define SW_RUN LOW      // Defines how the switch is used, High=Run 
#define SW_OFFLINE HIGH // Defines how the switch is used, Low=offline  
#define SW_UNDEFINED -1 // Use when the condition of the switch is not known

Servo servo;
HitDetector4 hitdetector(PIN_IRE1, PIN_IRE2, PIN_IRE3, PIN_IRE4, PIN_IRD1, PIN_IRD2, PIN_IRD3, PIN_IRD4);
EpicFmsWiFi fmswifi(WIFISSID, WIFIPK, "Slider Target");

char lineout[100];
uint32_t last_report_time = millis();
float vbattery = 0.0;  // Voltage reading on battery -- updated once per 0.5 sec//
uint32_t last_battery_udpate_time = millis();
uint32_t last_led_update_time = millis();
int led_cycle = 0;
long report_count = 0;
long cmd_count = 0;
long mainloop_count = 0;
int game_mode = GMODE_PWRUP;
int fms_game_mode = GMODE_STANDBY;
int slider = SLIDER_UNKNOWN;
int pw_open = PW_OPEN;
int pw_close = PW_CLOSE;
int pw_last = 0;
Cmdargs cmd_args;

void setup(void) {
  Serial.begin(115200);
  for(int i = 0; i < 10; i++) { Serial.println("."); delay(200);}
  delay(2000);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Slider Target.");
  Serial.println("Should be running on PCB V2 modified to V3.");
  Serial.println("Version 1.0, Oct 2021.");
  Serial.println(" ");

  Serial.println("Loading EEPROM configuration.");
  EEPROM.begin(128);  // We are allocating 128 bytes of EEPROM here.
  load_config();

  Serial.println("Setting up wifi.");
  fmswifi.set_oncommand(on_command);
  fmswifi.set_onstatus(on_status);
  fmswifi.begin();

  Serial.println("Setting up servo.");
  servo.attach(PIN_SERVO, 600, 2400);
  servo.writeMicroseconds(PW_CENTER);
  pw_last = PW_CENTER;
  slider = SLIDER_CENTER;

  Serial.println("Setting up on-board LED.");
  pinMode(PIN_ONBOARDLED, OUTPUT);
  digitalWrite(PIN_ONBOARDLED, LED_OFF);

  delay(100);
  Serial.println("Setting up the hit detector.");
  hitdetector.begin();

  Serial.println("Setting up Run Mode switch.");
  pinMode(PIN_GMODE, INPUT);

  Serial.println("Setup Done -- Starting Main Loop.");
}

// Reads the Battery Voltage
void battery_update(void) {
  if (millis() - last_battery_udpate_time < 500) return;
  last_battery_udpate_time = millis();
  int ir = analogRead(A0);
  vbattery = ir * VOLTSPERLSB;
}

// Here, we determine the game-mode that we think we should use.
void update_game_mode() {
    if (hitdetector.get_status() == HDSTATUS_INSELFTEST) {
        game_mode = GMODE_PWRUP;
        return;
    }
    if (hitdetector.get_status() == HDSTATUS_ERROR) {
        game_mode = GMODE_UNITERR;
        return;
    }
    if (fmswifi.infailure()) {
        game_mode = GMODE_FMSLOST;
        return;
    }
    if (!fmswifi.is_connected()) {
        game_mode = GMODE_WAITFORWIFI;
        return;
    }
    game_mode = fms_game_mode;
}

// Update the on-board led according to state
void led_update(void) {
    uint32_t tnow = millis();
    if(tnow - last_led_update_time < 50) return;
    last_led_update_time = tnow;
    if (hitdetector.get_status() == HDSTATUS_ERROR) {
        if (led_cycle > 0) {
            digitalWrite(PIN_ONBOARDLED, LED_ON);
            led_cycle = 0;
        } else {
            digitalWrite(PIN_ONBOARDLED, LED_OFF);
            led_cycle = 1;
        }
        return;
    }
    if (!fmswifi.is_connected()) {
        if (led_cycle < 20) digitalWrite(PIN_ONBOARDLED, LED_ON);
        else digitalWrite(PIN_ONBOARDLED, LED_OFF);
        led_cycle++;
        if(led_cycle > 40) led_cycle = 0; 
        return;
    }
    // All seems okay.
    digitalWrite(PIN_ONBOARDLED, LED_ON);
    return;
}

// Set the door position.
void slider_set(int place) {
    slider = place;
    slider_update();
}

// Update slider if we need to change pwm, or handle
// slow movement in the future.
void slider_update() {
    int pw = PW_CENTER;
    switch(slider) {
        case SLIDER_OPEN: pw = pw_open; break;
        case SLIDER_CLOSED: pw = pw_close; break;
        case SLIDER_CENTER: pw = PW_CENTER; break;
    }
    if (pw != pw_last) {
        pw_last = pw;
        servo.writeMicroseconds(pw);
    }
}

// Returns a string description of slider condition.
const char *slider_str(void) {
  switch(slider) {
      case SLIDER_CLOSED: return "Closed"; 
      case SLIDER_OPEN: return "Opened"; 
      case SLIDER_CENTER: return "Center";
      default: return "Unknown";
  }
}

// Reports status to terminal
void send_report(void) {
  if(millis() - last_report_time < 3000) return;
  last_report_time = millis();
  report_count++;
  const char *sinfo = slider_str();
  Serial.println("");
  sprintf(lineout, "%ld ***** Battery Voltage=%6.1f, GMode=%s", 
    report_count, vbattery, gmode_to_str(game_mode));
  Serial.println(lineout);
  sprintf(lineout, "Slider = %s, pw=%d, (open_pw=%d, close_pw=%d)", 
    sinfo, pw_last, pw_open, pw_close);
  Serial.println(lineout);
  fmswifi.debug_report();
  hitdetector.debug_report();
}

// *** MAIN LOOP **
void loop() {
  mainloop_count++;
  battery_update();
  led_update();
  hitdetector.update();
  slider_update();
  update_game_mode();
  fmswifi.set_hitcount(hitdetector.value());  
  fmswifi.update();
  send_report();
}  

#define EPICFMS_SIGNATURE 4235234  // Some random number...
typedef struct configuration {
  uint32_t signature;
  int pw_close;
  int pw_open;
} Configuration;

// Save important configuration parameters to EEPROM
void save_config() {
  Configuration cc;
  cc.signature = EPICFMS_SIGNATURE;
  cc.pw_close = pw_close;
  cc.pw_open = pw_open;
  EEPROM.put(64, cc);
  EEPROM.commit();
  Serial.println("EEPROM configuration saved.");
}

// Loads the configuation from EEPROM.
void load_config() {
  Configuration cc;
  EEPROM.get(64, cc);
  if (cc.signature != EPICFMS_SIGNATURE) {
    Serial.println("EEPROM not initialized. Loading Defaults");
    cc.pw_close = PW_CLOSE;
    cc.pw_open = PW_OPEN;
  } else {
    Serial.println("EEPROM configuration loaded successfully.");
  }
  pw_close = cc.pw_close;
  pw_open = cc.pw_open;
}

// Process commands from EpicFms server here.
void on_command(Cmdargs *args) {
  cmd_count++;
  sprintf(lineout, "Command Recevied from EpicFms server! Cmd Count = %ld", cmd_count);
  Serial.println(lineout);
  int nargs = args->ncount;
  for(int i = 0; i < nargs; i++) {
    process_cmd(args->names[i], args->values[i]);
  }
}

void process_cmd(const char *name, const char *value) {
  int iv = atoi(value);
  atoi(value);
  if(strcmp(name, "open") == 0) {
    if (iv == 1) slider_set(SLIDER_OPEN);
    return;
  }
  if(strcmp(name, "close") == 0) {
    if (iv == 1) slider_set(SLIDER_CLOSED);
    return;
  }
  if(strcmp(name, "center") == 0) {
    if (iv == 1) slider_set(SLIDER_CENTER);
    return;
  }
  if(strcmp(name, "openpwm") == 0) {
    if (iv > 750 && iv < 2300) pw_open = iv;
    return;
  }
  if(strcmp(name, "closepwm") == 0) {
    if (iv > 750 && iv < 2300) pw_close = iv;
    return;
  }
  if(strcmp(name, "gamemode") == 0) {
    if(iv == 0) {
      iv = str_to_gmode(value);
    }
    if(iv != 0) fms_game_mode = iv;
    return;
  }
  if(strcmp(name, "saveconfig") == 0) {
    if (iv != 1) return;
    save_config();
    return;
  }
  if(strcmp(name, "selftest") == 0) {
    Serial.println("Starting Self Test.");
    hitdetector.start_selftest();
    return;
  }
  sprintf(lineout, "Unknown command received from server: %s = %s", name, value);
  Serial.println(lineout);
}

// Process status requests from the server here.
void on_status(char *json) {
  char lineout[100];
  strncpy(json, "{\n", MAX_STATUS_CHARS);
  
  sprintf(lineout, "\"unit\" : \"slider\", \n");
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"gamemode\" : \"%s\", \n", gmode_to_str(game_mode));
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"mainloop_count\" : %ld, \n", mainloop_count);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"command_count\" : %ld, \n", cmd_count);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hits\" : %ld, \n", hitdetector.value());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"slider\" : %s, \n", slider_str());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"pw_last\" : %d, \n", pw_last);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"pw_open\" : %d, \n", pw_open);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"pw_close\" : %d, \n", pw_close);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hitdetector_status\" : \"%s\", \n", hitdetector.get_status_str());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hitdetector_fail_code\" : %d, \n", hitdetector.get_fail_code());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"batvolts\" : %8.2f \n", vbattery);
  strncat(json, lineout, MAX_STATUS_CHARS);

  strncat(json, "}\n", MAX_STATUS_CHARS);
}
