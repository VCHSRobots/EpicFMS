/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/

#include <Servo.h>

Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position
const int buttonPin = 5;    // the number of the pushbutton pin
unsigned long tlast = millis();
int state = 0;  // 0 = open, 1 = closed
int mode = 0; // 0: moving toward close. 1: closed, 2: moving toward open, 3: Open
unsigned long tmodestart = millis();

void setup() {
  myservo.attach(4, 800, 1900);  // attaches the servo on pin 9 to the servo object
  pinMode(buttonPin, INPUT_PULLUP);
}

void move_to_close() {
  digitalWrite(13, HIGH);
  if (millis() - tlast > 10) {
    tlast = millis();
    pos -= 10;
    if (pos < 0) {
        pos = 0;
        mode = 1;
    }
    myservo.write(float(pos));
  }
}

void hold_close() {
  digitalWrite(13, HIGH);
  if (millis() - tlast > 5000) {
    tlast = millis();
    mode = 2;
  }
}

void move_to_open() {
  digitalWrite(13, LOW);
  if (millis() - tlast > 10) {
    tlast = millis();
    pos += 10;
    if (pos > 180) {
      pos = 180;
      mode = 3;
    }
    myservo.write(float(pos));
  }
}

void hold_open() {
  digitalWrite(13, LOW);
  if (millis() - tlast > 6000) {
    tlast = millis();
    mode = 0;
  }
}


void loop() {
  if (mode == 0) move_to_close();
  if (mode == 1) hold_close();
  if (mode == 2) move_to_open();
  if (mode == 3) hold_open();
}


/*
void loop() {
  for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
  for (pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
}

*/
