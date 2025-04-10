void playVideo(int index) {
  for (int i = 0; i < videos.length; i++) {
    if (i == index) {
      if (!videos[i].isPlaying()) {
        videos[i].loop();
      }
    } else {
      videos[i].stop();
    }
  }

  image(videos[index], 0, 0, width, height);
}

void stopAllVideos() {
  for (int i = 0; i < videos.length; i++) {
    videos[i].stop();
  }
}

void screenDefault() {
  if (!audio.isPlaying()) {
    audio.play();
  }
  image(defaultBg, 0, 0, width, height);
}

void screen00() {
  if (!audio.isPlaying()) {
    audio.loop();
  }
  playVideo(0);
}

void screen01() {
  playVideo(1);
}

void screen02() {
  stopAllVideos();
  if (audio.isPlaying()) {
    audio.stop();
  }
  playVideo(2);

  if (screenStartTime == 0) {
    screenStartTime = millis();
  }
  if (millis() - screenStartTime >= 3000) {
    currentScreen = 3;
  }
}

void screen03() {
  stopAllVideos();
  if (audio.isPlaying()) {
    audio.stop();
  }
  playVideo(3);
  screenStartTime = 0;
}

void screen04() {
  stopAllVideos();
  if (audio.isPlaying()) {
    audio.stop();
  }
  playVideo(4);
}

void screen05() {
  stopAllVideos();
  if (audio.isPlaying()) {
    audio.stop();
  }
  playVideo(5);
}
