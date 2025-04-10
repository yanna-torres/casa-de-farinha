import processing.sound.*;
import processing.video.*;

SoundFile audio;
Movie[] videos = new Movie[1];
PFont garamond;
PImage defaultBg;

void loadAssets() {
  audio = new SoundFile(this, "teste05.mp3");
  garamond = createFont("EBGaramond-Regular.ttf", 128);
  textFont(garamond, 20);
  textAlign(CENTER, CENTER);
  textSize(50);
  defaultBg = loadImage("tela.jpg");

  for (int i = 0; i < videos.length; i++) {
    videos[i] = new Movie(this, "tela" + i + ".mov");
    videos[i].volume(1.0);
  }

  background(92, 41, 0);
}
