#ifndef CONFIG_H
#define CONFIG_H

const int NUM_SWITCHES = 6;

const int switch_pins[NUM_SWITCHES] = {2, 3, 4, 5, 6, 7};
const char* switch_messages[NUM_SWITCHES] = {
  "Switch 1 Pressed",
  "Switch 2 Pressed",
  "Switch 3 Pressed",
  "Switch 4 Pressed",
  "Switch 5 Pressed",
  "Switch 6 Pressed"
};

const int led = 13;

#endif
