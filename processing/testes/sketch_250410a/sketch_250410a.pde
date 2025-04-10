boolean simulateSerial = true;

int currentScreen = -1;
int screenStartTime = 0;
int screenStartTime02 = 0;

void setup() {
  size(1024, 720);
  loadAssets();
  setupSerial();
  fullScreen();
}

void draw() {
  if (!simulateSerial) {
    monitorSerial();
  }

  background(0); // limpa a tela antes de desenhar vídeo

  switch (currentScreen) {
    case -1: screenDefault(); break;
    case 0: screen00(); break;
    //case 1: screen01(); break;
    //case 2: screen02(); break;
    //case 3: screen03(); break;
    //case 4: screen04(); break;
    //case 5: screen05(); break;
  }

  println("TELA: " + currentScreen);
}

void keyPressed() {
  if (simulateSerial && key >= '0' && key <= '5') {
    int simulatedScreen = key - '0';
    currentScreen = simulatedScreen;
    println("Simulação de tecla: TELA " + simulatedScreen);
  }
}

void movieEvent(Movie m) {
  m.read(); // necessário para atualizar os frames do vídeo
}
