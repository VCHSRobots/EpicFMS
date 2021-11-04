// movergoal.ino -- Sketch for a Mover Goal 
// Epic Robotz, dlb, Oct 2021
//
// This sketch is intended to run in a ESP8266 mounted on a
// V2 version of the PCB that has been modified to to the V3
// circuit. Please see PCB_Log.md for more information about
// V3.
//
// A Mover Goal has 4 independent IR beams each with its own 
// IR emitter and an IR detector.  It also has two rings of
// NEO leds mounted near the top of the goal.  Each ring
// has 20 LEDs and the two rings are wired in series, with
// the top being first in the series.
//
// This code does the following:
//
//  1. Counts balls, with the individule IR beams
//  2. Displays status and hit detection on the NEO Leds
//  3. Displays debug status on the on-board LED
//  4. Reads the battery voltage
//  5. Communicates with the EpicFMS server to give status
//     and take directions for a whole host of parameters.
//
//  The on-board LED indicates status as follows:
//  
//   Fast Blink = Error in IR Detectors
//   Slow Blink = Waiting for WiFi 
//   ON         = Connected, no error
//   Off        = Undefined -- probably programming error.
//
// NOTE: although the moving target as four separate IR beams
// that are not criss-crosed like the slider target, we
// use the same detection code (HitDetector4).  The only downside
// is that the HitDetector4 won't be able to detect a simultaneous
// hit from two directions.  For that, new software must be
// written.  However, for the fall 2021 game, each mover unit
// will only face one opponent, so shots should only come from
// one direction as a time.
//
// NOTE2: Since I am in a hurry, this code does not have a
// practice mode, nor a does is monitor a reset swich.  That
// is, both auxulary button/switch inputs are ignored.
//

#include <Arduino.h>
#include <EpicFmsLib.h>

#define WIFISSID "epicfms"
#define WIFIPK  "epic4fms"

// Setup for V3 of the PCB:
#define PIN_NONE    -1  // Means no pin assigned.
#define PIN_HRST    16  // D0/G16 -- push button with pullup (not used, also is onboard LED)
#define PIN_NEO      5  // D1/G5 -- NEO output
#define PIN_IRD2     4  // D2/G4 -- IR Detectore vas OpAmp (Takes over NEO2!)
#define PIN_IRE4     0  // D3/G0 -- IR Emitter via buffer
#define PIN_IRE3     2  // D4/G2 -- IR Emitter via buffer
#define PIN_IRD4    14  // D5/G14 -- IR Detector via OpAmp
#define PIN_IRD3    12  // D6/G12 -- IR Detector via OpAmp
#define PIN_IRE2    13  // D7/G13 -- IR Emitter via butter
#define PIN_IRE1    15  // D8/G15 -- IR Emitter via buffer
#define PIN_IRD1    10  // SD3/G10 -- IR Detector via OpAmp
#define PIN_GMODE    9  // SD2/G9  -- Switch with pullup (not used)
#define NPIXELS 40

// Definations for On-board LED.  Note that this
// conflicts with PIN_HRST.  Do not use PIN_HRST on the
// slider!!
#define PIN_ONBOARDLED 16
#define LED_OFF HIGH
#define LED_ON LOW

// Battery parameters
#define VOLTSPERLSB 0.007647 // Volts per bit on analog sensor for V-Battery

// Switch parameters -- not currently used but kept for future
#define SW_RUN LOW      // Defines how the switch is used, High=Run 
#define SW_OFFLINE HIGH // Defines how the switch is used, Low=offline  
#define SW_UNDEFINED -1 // Use when the condition of the switch is not known

NeoMover neopixels(PIN_NEO, PIN_NONE, NPIXELS, NPIXELS);
HitDetector4 hitdetector(PIN_IRE1, PIN_IRE2, PIN_IRE3, PIN_IRE4, PIN_IRD1, PIN_IRD2, PIN_IRD3, PIN_IRD4);
EpicFmsWiFi fmswifi(WIFISSID, WIFIPK, "Mover Target");

char lineout[100];
uint32_t last_report_time = millis();
float vbattery = 0.0;  // Voltage reading on battery -- updated once per 0.5 sec//
bool battery_low = false;  // True if battery is a concern
uint32_t time_of_battery_low = millis();
bool battery_low_pending = false;
uint32_t last_battery_udpate_time = millis();
uint32_t last_led_update_time = millis();
int led_cycle = 0;
long report_count = 0;
long cmd_count = 0;
long mainloop_count = 0;
int game_mode = GMODE_PWRUP;
int fms_game_mode = GMODE_STANDBY;
uint32_t last_hit_count = 0;
Cmdargs cmd_args;

void setup(void) {
  Serial.begin(115200);
  for(int i = 0; i < 10; i++) { Serial.println("."); delay(200);}
  delay(2000);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Mover Target.");
  Serial.println("Should be running on PCB V2 modified to V3.");
  Serial.println("Version 1.0, Oct 2021.");
  Serial.println(" ");

  Serial.println("Setting up on-board LED.");
  pinMode(PIN_ONBOARDLED, OUTPUT);
  digitalWrite(PIN_ONBOARDLED, LED_ON);

  Serial.println("Setting up Neo pixels.");
  neopixels.begin();
 
  Serial.println("Setting up wifi.");
  fmswifi.set_oncommand(on_command);
  fmswifi.set_onstatus(on_status);
  fmswifi.begin();

  delay(100);
  Serial.println("Setting up the hit detector.");
  hitdetector.begin();

  // Setup both inputs to make sure they are not outputs.
  Serial.println("Setting up switch input.");
  pinMode(PIN_GMODE, INPUT);

  Serial.println("Setup Done -- Starting Main Loop.");
}

// Reads the Battery Voltage.  Declears a battery low
// state if its been low for over 5 seconds.
void battery_update(void) {
  if (millis() - last_battery_udpate_time < 500) return;
  last_battery_udpate_time = millis();
  int ir = analogRead(A0);
  vbattery = ir * VOLTSPERLSB;
  bool islow = (vbattery < 5.7);  // Battery should run at 6.00 volts from regulator.
  if (!islow) {
      battery_low = false;
      battery_low_pending = false;
  } else {
      if (!battery_low) {
        if (battery_low_pending) {
          if (millis() - time_of_battery_low > 5000) {
              battery_low = true;
          }
        } else {
            battery_low_pending = true;
            time_of_battery_low = millis();
        } 
      }
  }
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

// Prepare data for neo leds, and update neo
void update_neo() {
  Neo_Mover_Params p;
  p.game_mode = game_mode;
  p.online = true;  // This use to be controlled by a switch.
  p.hiterror = (hitdetector.get_status() == HDSTATUS_ERROR);
  p.hitcount = hitdetector.value();
  p.batterylow = battery_low;
  neopixels.set_params(&p);
  neopixels.update(game_mode);
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

// Reports status to terminal
void send_report(void) {
  if(millis() - last_report_time < 3000) return;
  last_report_time = millis();
  report_count++;
  Serial.println("");
  sprintf(lineout, "%ld ***** Battery Voltage=%6.1f, BLow=%d, GMode=%s", 
    report_count, vbattery, battery_low, gmode_to_str(game_mode));
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
  update_game_mode();
  update_neo();
  uint32_t hits = hitdetector.value();
  if (hits != last_hit_count) neopixels.show_hit();
  last_hit_count = hits;
  fmswifi.set_hitcount(hits);  
  fmswifi.update();
  send_report();
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
  if(strcmp(name, "gamemode") == 0) {
    if(iv == 0) {
      iv = str_to_gmode(value);
    }
    if(iv != 0) fms_game_mode = iv;
    return;
  }
  if(strcmp(name, "selftest") == 0) {
    Serial.println("Starting Self Test.");
    hitdetector.start_selftest();
    return;
  }
  if(strcmp(name, "resethits") == 0) {
    if (iv != 1) return;
    Serial.println("Reseting Hit Count.");
    hitdetector.reset_hits();
    return;
  }
  sprintf(lineout, "Unknown command received from server: %s = %s", name, value);
  Serial.println(lineout);
}

// Process status requests from the server here.
void on_status(char *json) {
  char lineout[100];
  strncpy(json, "{\n", MAX_STATUS_CHARS);
  
  sprintf(lineout, "\"unit\" : \"mover\", \n");
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"gamemode\" : \"%s\", \n", gmode_to_str(game_mode));
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"mainloop_count\" : %ld, \n", mainloop_count);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"command_count\" : %ld, \n", cmd_count);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hits\" : %ld, \n", hitdetector.value());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hitdetector_status\" : \"%s\", \n", hitdetector.get_status_str());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hitdetector_fail_code\" : %d, \n", hitdetector.get_fail_code());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"batvolts\" : %8.2f, \n", vbattery);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"batlow\" : %d \n", battery_low);
  strncat(json, lineout, MAX_STATUS_CHARS);

  strncat(json, "}\n", MAX_STATUS_CHARS);
}
