int sensorPin = A0;    // select the input pin for the potentiometer
int sensorValue = 0;  // variable to store the value coming from the sensor
char lineout[100];

void setup() {
  // declare the ledPin as an OUTPUT:
  Serial.begin(115200);
  Serial.println("Analog Test");
  analogReference(EXTERNAL);
}

void loop() {
  sensorValue = analogRead(sensorPin);
  sprintf(lineout, "Reading = %d", sensorValue);
  Serial.println(lineout);
  delay(100);
}
