import processing.serial.*;
import processing.sound.*;


Serial myPort;

int card_id = 0;
int proximity = 0;
int currentScreen = -1;
int screenStartTime = 0;
int screenStartTime02 = 0;


int DIST = 0;
int ID = 0;

SoundFile audio;
PImage[] telas = new PImage[6];

PFont garamond;

void setup() {
  size(1024, 720);

  audio = new SoundFile(this, "teste05.mp3");
  garamond = createFont("EBGaramond-Regular.ttf", 128);
  textFont(garamond, 20);

  for (int i = 0; i < telas.length; i++) {
    telas[i] = loadImage("tela"+i+".png");
    telas[i].resize(width, height);
    telas[i].loadPixels();
  }

  textAlign(CENTER, CENTER);
  textSize(50);
  background(92, 41, 0);
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
  println("TELA: "+currentScreen);
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
    println(currentScreen);
  }
}


void screenDefault() {
  if (!audio.isPlaying()) {
    audio.play();
  }
}

void screen00() {
  if (!audio.isPlaying()) {
    audio.loop();
  }
  image(telas[0], 0, 0, width, height);
  if (millis() - screenStartTime02 >= 3000) {
    rectMode(CENTER);
    fill(92, 41, 0);
    noStroke();
    rect(width/2 +width/4, height/3, width/4, height/4, 15);
    fill(255);
    text("Interaja com os cards e objetos!", width/2 +width/4, height/3, width/4 - 100, height/4);
  }
}

void screen01() {
  image(telas[1], 0, 0, width, height);
}

void screen02() {
  if (audio.isPlaying()) {
    audio.stop();
  }
  image(telas[2], 0, 0, width, height);
  
  if (screenStartTime == 0) {
    screenStartTime = millis();
  }

  if (millis() - screenStartTime >= 3000) {
    currentScreen = 3;
  }
}

void screen03() {
  if (audio.isPlaying()) {
    audio.stop();
  }
  image(telas[3], 0, 0, width, height);
  screenStartTime = 0;
}

void screen04() {
  if (audio.isPlaying()) {
    audio.stop();
  }
  image(telas[4], 0, 0, width, height);
}

void screen05() {
  if (audio.isPlaying()) {
    audio.stop();
  }
  image(telas[5], 0, 0, width, height);
}

void displayScreen(String text) {
  background(0);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20);
  text(text, width / 2, height / 2);

  //if (currentScreen == 2 && screenStartTime == 0) {
  //  screenStartTime = millis();
  //}
}
