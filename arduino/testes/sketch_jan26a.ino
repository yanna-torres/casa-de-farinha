// define variables for pins
const int led = 13;
const int switch_pin = 2;
// variable for switch state
int switch_state;

void setup() {
  // put your setup code here, to run once:
  // set LED pin as output
  Serial.begin(9600);
  pinMode(led,OUTPUT);
  // set switch pin as input
  pinMode(switch_pin,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  // read switch state
  switch_state = digitalRead(switch_pin);
  // turn LED on or off depending on state
  if(switch_state == HIGH){
    digitalWrite(led,LOW);
    Serial.println("Is OFF");
  }
  else{
    digitalWrite(led,HIGH);
    Serial.println("Is Pressed");
  }
}
