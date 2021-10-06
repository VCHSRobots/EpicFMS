

void handleRoot() {
  //digitalWrite(led, 1);
  char line[100];
  sprintf(line, "Epic FMS Target Unit.");
  server.send(200, "text/plain", line);
  //digitalWrite(led, 0);
}

void handleFMS() {
  //digitalWrite(led, 1);
  char json[100];
  String a1 = server.arg("gamestatus");
  sprintf(json,"{\"hit_count\" = %d }", hit_count);
  //sprintf(json, "Hello from epic FMS counter. Game Status=%s, Count=%ld\r\n", a1.c_str(), hit_count);
  server.send(200, "text/json", json);
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
