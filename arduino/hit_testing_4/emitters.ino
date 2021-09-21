void turn_off_all_emitters() {
  for (int i = 0; i < 4; i++) digitalWrite(raw_emitter_pins[i], LOW);
  delay(1);
}

void turn_on_all_emitters() {
  for (int i = 0; i < 4; i++) digitalWrite(raw_emitter_pins[i], HIGH);
  delay(1);
}

void turn_on_emitter(int index) {
  digitalWrite(raw_emitter_pins[index], HIGH);
  delay(1);
}