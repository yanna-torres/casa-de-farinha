import processing.serial.*;

Serial myPort;

int card_id = 0;
int proximity = 0;
int currentScreen = -1;
int screenStartTime = 0;

int DIST = 0;
int ID = 0;

PImage[] telas = new PImage[5];

void setup() {
  for (int i = 0; i < telas.length; i++) {
    telas[i] = loadImage("tela"+i+".png");
    telas[i].resize(width, height);
    telas[i].loadPixels();
  }
  textAlign(CENTER);
  textSize(50);
  background(46, 26, 8);
  String[] ports = Serial.list();
  if (ports.length > 2) {
    myPort = new Serial(this, ports[2], 9600);
  } else {
    println("Não há portas seriais disponíveis.");
  }
  fullScreen();
}

void draw() {
  monitorSerial();
  switch (currentScreen) {
  case -1:
    screenDefault();
    break;
  case 0:
    screen00();
    break;
  case 1:
    screen01();
    break;
  case 2:
    screen02();
    break;
  case 3:
    screen03();
    break;
  case 4:
    screen04();
    break;
  case 5:
    screen05();
    break;
  }
  //println("TELA: "+currentScreen);
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
  }
}


void screenDefault() {

  text("Interaja com a instalação!", width/2, height/2);
}

void screen00() {
  image(telas[0], 0, 0);
}

void screen01() {
  image(telas[1], 0, 0);
}

void screen02() {
  image(telas[2], 0, 0);
  if (millis() - screenStartTime >= 3000) {
    currentScreen = 3;
  }
}

void screen03() {
  image(telas[2], 0, 0);
}

void screen04() {
  image(telas[3], 0, 0);
}

void screen05() {
  image(telas[4], 0, 0);
}

void displayScreen(String text) {
  background(0);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20);
  text(text, width / 2, height / 2);

  if (currentScreen == 2 && screenStartTime == 0) {
    screenStartTime = millis();
  }
}
