import processing.serial.*;

Serial myPort;

void setupSerial() {
  if (!simulateSerial) {
    String[] ports = Serial.list();
    if (ports.length > 2) {
      myPort = new Serial(this, ports[2], 9600);
    } else {
      println("Não há portas seriais disponíveis.");
    }
  }
}

void monitorSerial() {
  while (myPort != null && myPort.available() > 0) {
    String message = myPort.readStringUntil('\n');
    if (message != null) {
      parseMessage(message);
    }
  }
}

void parseMessage(String message) {
  if (message.startsWith("TELA")) {
    String telaValue = message.substring(5).trim();
    currentScreen = Integer.parseInt(telaValue);
    println("Comando Serial: TELA " + currentScreen);
  }
}
