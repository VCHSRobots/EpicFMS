

void handleRoot() {
  //digitalWrite(led, 1);
  char line[100];
  server.send(200, "text/plain", line);
  //digitalWrite(led, 0);
}

void handleFMS() {
  //digitalWrite(led, 1);
  char line[100];
  cnt++;
  String a1 = server.arg("gamestatus");
  sprintf(line, "Hello from epic FMS counter. Game Status=%s, Count=%d\r\n", a1.c_str(), cnt);
  server.send(200, "text/plain", line);
  //digitalWrite(led, 0);
}

void handleNotFound() {
  //digitalWrite(led, 1);
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i = 0; i < server.args(); i++) {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
  //digitalWrite(led, 0);
}
