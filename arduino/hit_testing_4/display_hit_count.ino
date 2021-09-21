// display_hit_count() -- writes the modulo of the input
// the the display LEDs.
void display_hit_count(int c) {
  if (c & 0x0001) {
    digitalWrite(disp1_pin, HIGH);
  } else {
    digitalWrite(disp1_pin, LOW);
  }
  if (c & 0x0002) {
    digitalWrite(disp2_pin, HIGH);
  } else {
    digitalWrite(disp2_pin, LOW);
  }
  if (c & 0x0004) {
    digitalWrite(disp3_pin, HIGH);
  } else {
    digitalWrite(disp3_pin, LOW);
  }
    if (c & 0x0008) {
    digitalWrite(disp4_pin, HIGH);
  } else {
    digitalWrite(disp4_pin, LOW);
  }
}
