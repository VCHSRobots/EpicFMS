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
#include <EpicFmsLib.h>
#include <EEPROM.h>

#define WIFISSID "epicfms"
#define WIFIPK  "epic4fms"

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

// NeoConductor neopixels = NeoConductor(PIN_NEO, PIN_NONE, NPIXELS, NPIXELS);
// BasketMotor bmotor = BasketMotor(PIN_PWM, PIN_A, PIN_B);
// HitDetector hitdetector = HitDetector(PIN_IRE, PIN_IRD);
// EpicFmsWiFi fmswifi = EpicFmsWiFi(WIFISSID, WIFIPK, "Basket Target");

NeoConductor neopixels(PIN_NEO, PIN_NONE, NPIXELS, NPIXELS);
BasketMotor bmotor(PIN_PWM, PIN_A, PIN_B);
HitDetector hitdetector(PIN_IRE, PIN_IRD);
EpicFmsWiFi fmswifi(WIFISSID, WIFIPK, "Basket Target");

char lineout[100];
unsigned long last_report_time = millis();
int mode = SW_OFFLINE; // Set by switch, updated on main loop.
int lastmode = SW_UNDEFINED;
float vbattery = 0.0;  // Voltage reading on battery -- updated once per 0.5 sec//
unsigned long last_battery_udpate_time = millis();
long report_count = 0;
long cmd_count = 0;
long mainloop_count = 0;
int game_mode = GMODE_PWRUP;
int fms_game_mode = GMODE_STANDBY;
Cmdargs cmd_args;

void setup(void) {
  Serial.begin(115200);
  delay(500);
  Serial.println(" ");  
  Serial.println("Epic Game Slave Device For Basket Target.");
  Serial.println("Version 0.5, Oct 2021.");
  Serial.println(" ");

  Serial.println("Loading EEPROM configuration.");
  EEPROM.begin(128);  // We are allocating 128 bytes of EEPROM here.
  load_config();

  Serial.println("Setting up Neo pixels.");
  neopixels.begin();
  neopixels.show_solidcolor(0, 128, 0);
 
  Serial.println("Setting up wifi.");
  fmswifi.set_oncommand(on_command);
  fmswifi.set_onstatus(on_status);
  fmswifi.begin();

  delay(100);
  Serial.println("Setting up the hit detector.");
  hitdetector.begin();

  Serial.println("Setting up Run Mode switch.");
  pinMode(PIN_GMODE, INPUT);

  Serial.println("Setting up motor.");
  bmotor.begin();
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

// Prepare data for neo leds.
void update_neo() {
  Neo_Basket_Params p;
  p.game_mode = game_mode;
  p.online = (mode == SW_RUN);
  p.hiterror = (hitdetector.get_status() == HDSTATUS_ERROR);
  p.stuck = bmotor.isstuck();
  p.jerking = bmotor.injam();
  p.jamcount = bmotor.jamcount(); 
  long encoder_ticks = bmotor.encoderpos();
  long nrevs_ticks = (encoder_ticks >> 10) * 1024; 
  p.revs = float(encoder_ticks - nrevs_ticks) / 1024.0;
  p.hitcount = hitdetector.value();
  neopixels.show_basketstatus(&p);
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
    if (bmotor.isstuck()) {
        game_mode = GMODE_UNITERR;
        return;
    }
    if (mode == SW_OFFLINE) {
        game_mode = GMODE_PRACTICE;
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

// Reports status to terminal
void send_report(void) {
  if(millis() - last_report_time < 1000) return;
  last_report_time = millis();
  report_count++;
  Serial.println("");
  const char *swout;
  if (mode == SW_RUN) swout = "Run";
  else swout = "Offline";
  sprintf(lineout, "%ld ***** Battery Voltage=%6.1f, Sw=%s, GMode=%s", 
    report_count, vbattery, swout, gmode_to_str(game_mode));
  Serial.println(lineout);
  fmswifi.debug_report();
  bmotor.debug_report();
  hitdetector.debug_report();
}

void loop() {
  mainloop_count++;
  static int lastmode = SW_UNDEFINED;
  mode = digitalRead(PIN_GMODE);
  if (mode != lastmode) {
    lastmode = mode;
    if (mode == SW_OFFLINE) {
        hitdetector.start_selftest(); // Start with clearing errors.
        if (vbattery > 8.0) bmotor.enable();  // Run the motor in offline.
    } else {
      bmotor.disable(); // For now.  Later, the server will take care of this.
    }
  }  
  battery_update();
  bmotor.update();
  hitdetector.update();
  update_game_mode();
  update_neo();
  fmswifi.set_hitcount(hitdetector.value());  
  fmswifi.update();
  send_report();
}  

#define EPICFMS_SIGNATURE 1324214  // Some random number...
typedef struct configuration {
  uint32_t signature;
  int run_pwm;
} Configuration;

// Save important configuration parameters to EEPROM
void save_config() {
  Configuration cc;
  cc.signature = EPICFMS_SIGNATURE;
  cc.run_pwm = bmotor.runpwm();
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
    cc.run_pwm = PW_RUN0;
  } else {
    Serial.println("EEPROM configuration loaded successfully.");
  }
  bmotor.setpwm(cc.run_pwm);
}

// Process commands from EpicFms server here.
void on_command(Cmdargs *args) {
  cmd_count++;
  sprintf(lineout, "Command Recevied from EpicFms server! %ld", cmd_count);
  Serial.println(lineout);
  int nargs = args->ncount;
  for(int i = 0; i < nargs; i++) {
    process_cmd(args->names[i], args->values[i]);
  }
}

void process_cmd(const char *name, const char *value) {
  int iv = atoi(value);
  atoi(value);
  if(strcmp(name, "motor") == 0) {
    if (mode == SW_RUN && iv != 1) {
      bmotor.disable();
    }
    if (mode == SW_RUN && iv == 1 && vbattery > 9.0) {
      bmotor.enable();
    }
    return;
  }
  if(strcmp(name, "pwm") == 0) {
    if (iv != 0) {
      bmotor.setpwm(iv);
    }
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
  }
  if(strcmp(name, "selftest") == 0) {
    if (iv != 1 || mode != SW_RUN) return;
    hitdetector.start_selftest();
  }
}

// Process status requests from the server here.
void on_status(char *json) {
  char lineout[100];
  strncpy(json, "{\n", MAX_STATUS_CHARS);
  
  sprintf(lineout, "\"unit\" : \"basket\", \n");
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"switch\" : \"%s\", \n", mode == SW_OFFLINE ? "Offline" : "Game");
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"gamemode\" : \"%s\", \n", gmode_to_str(game_mode));
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"mainloop_count\" : %ld, \n", mainloop_count);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"command_count\" : %ld, \n", cmd_count);
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hits\" : %ld, \n", hitdetector.value());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"motor_enabled\" : %d, \n", bmotor.isenabled());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"in_jam\" : %d, \n", bmotor.injam());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"jam_count\" : %ld, \n", bmotor.jamcount());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"stuck\" : %d, \n", bmotor.isstuck());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"rpm\" : %8.2f, \n", bmotor.currentrpm());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"pwm\" : %d, \n", bmotor.currentpwm());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"run_pwm\" : %d, \n", bmotor.runpwm());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"encoder\" : %ld, \n", bmotor.encoderpos());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"hitdetector_status\" : \"%s\", \n", hitdetector.get_status_str());
  strncat(json, lineout, MAX_STATUS_CHARS);

  sprintf(lineout, "\"batvolts\" : %8.2f \n", vbattery);
  strncat(json, lineout, MAX_STATUS_CHARS);

  strncat(json, "}\n", MAX_STATUS_CHARS);
}


