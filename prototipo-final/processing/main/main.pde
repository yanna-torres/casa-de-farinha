// DIST != 0 && DIST < 5 -> 0
// 39 0 22 4B D1 -> 1
// A0 72 5A C8 5A -> 2
// A0 72 7A 19 38 -> 4
// A0 72 5A C8 25 -> 5

int card_id = 0;
int proximity = 0;
int currentScreen = -1;
int screenStartTime = 0; 

void setup() {
  fullScreen();
}

void draw() {
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
}



void screenDefault() {
  displayScreen("Tela Default");
}

void screen00() {
  displayScreen("Tela 0");
}

void screen01() {
  displayScreen("Tela 1");
}

void screen02() {
  displayScreen("Tela 2");

  if (millis() - screenStartTime >= 3000) {
    currentScreen = 3;
  }
}

void screen03() {
  displayScreen("Tela 3");
}

void screen04() {
  displayScreen("Tela 4");
}

void screen05() {
  displayScreen("Tela 5");
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
