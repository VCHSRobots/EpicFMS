#include <Servo.h>

Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position
const int buttonPin = 5;    // the number of the pushbutton pin
int state = 0;  // 0 = open, 1 = closed
int mode = 0; // 0: moving toward close. 1: closed, 2: moving toward open, 3: Open
int runstop_pin = 2;   // D2
int openclose_pin = 3; // D3
int closeadj_pin = 1;  // A1
int openadj_pin = 2;   // A2
int runstop = 0;
int openclose = 0;
int hold_countdown = 0;
int last_runstop = -1;
int last_openclose = -1;

void setup() {
  myservo.attach(4);  // attaches the servo on pin 9 to the servo object
  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(runstop_pin, INPUT_PULLUP);
  pinMode(openclose_pin, INPUT_PULLUP);
  Serial.begin(115200);
}

void move_to_close() {
  digitalWrite(13, HIGH);
  delay(15);
  pos -= 2;
  int aval = analogRead(closeadj_pin);
  int lowstop = map(aval, 0, 1023, 0, 180);     
  if (pos < lowstop) {
      pos = lowstop;
      hold_countdown = 400;
      mode = 1;
  }
  myservo.write(float(pos));
}

void hold_close() {
  digitalWrite(13, HIGH);
  delay(10);
  hold_countdown--;
  if (hold_countdown <= 0) mode = 2;
}

void move_to_open() {
  digitalWrite(13, LOW);
  delay(15);
  pos += 2;
  int aval = analogRead(openadj_pin);
  int highstop = map(aval, 0, 1023, 0, 180);
  if (pos > highstop) {
    pos = highstop;
    hold_countdown = 400;
    mode = 3;
  }
  myservo.write(float(pos));
}

void hold_open() {
  digitalWrite(13, LOW);
  delay(10);
  hold_countdown--;
  if (hold_countdown <= 0) mode = 0;
}

void loop() {
  char sout[100];
  runstop = digitalRead(runstop_pin);
  openclose = digitalRead(openclose_pin);
  if (runstop != last_runstop || openclose != last_openclose) {
    sprintf(sout, " Run = %d, openclose = %d.", runstop, openclose);
    Serial.println(sout);
    last_runstop = runstop;
    last_openclose = openclose;
  }

  if (runstop) {
    if (mode == 0) move_to_close();
    if (mode == 1) hold_close();
    if (mode == 2) move_to_open();
    if (mode == 3) hold_open();
  } else {
    if (openclose) {
      move_to_open();
    } else {
      move_to_close();
    }
  }
}



