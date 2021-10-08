//#define PIN_A      9  // 
#define PIN_B      10 // 

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  //pinMode(PIN_A, INPUT);
  pinMode(PIN_B, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println("hi");
  delay(500);
}
