void display_color(int r, int g, int b) {
  sprintf(lineout, "Displaying = %d, %d, %d", r, g, b);
  Serial.println(lineout);
  for (int i = 0; i < NPIXELS; i++) {
    pixels1.setPixelColor(i, pixels1.Color(r, g, b));
    pixels2.setPixelColor(i, pixels2.Color(r, g, b));
  }
  pixels1.show();
  pixels2.show();
}

void change_color() {
  static int icolor = 0;
  icolor++;
  if(icolor > 5) icolor = 0;
  switch(icolor) {
    case 0: display_color(0, 0, 255); break;
    case 1: display_color(0, 255, 0); break;
    case 2: display_color(255, 0, 0); break;
    case 3: display_color(255, 0, 255); break;
    case 4: display_color(0, 255, 255); break;
    case 5: display_color(255, 255, 255); break;
  }
}
