#include "config.h"

void setup() {
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  for (int i = 0; i < NUM_SWITCHES; i++) {
    pinMode(switch_pins[i], INPUT);
  }
}

void loop() {
  for (int i = 0; i < NUM_SWITCHES; i++) {
    int state = digitalRead(switch_pins[i]);
    if (state == LOW) {
      digitalWrite(led, HIGH);
      Serial.println(switch_messages[i]);
    } else {
      digitalWrite(led, LOW);
    }
  }
  delay(100);
}
