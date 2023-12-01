// https://www.tinkercad.com/things/fRfyrjmQbRj-copy-of-16-sensor-de-proximidade/editel?tenant=circuits

#define trigger 4
#define echo 5

void setup() {
  Serial.begin(9600);
  pinMode(trigger, OUTPUT);
  pinMode(echo, INPUT);
}

void loop() {
  digitalWrite(trigger, LOW);
  delayMicroseconds(2);
  digitalWrite(trigger, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigger, LOW);

  long duracao = pulseIn(echo, HIGH);
  long distanciaCm = (duracao / 2) * 0.0343;

  Serial.print("Distancia: ");
  Serial.print(distanciaCm);
  Serial.println(" cm");

  delay(1000); // Adiciona um atraso para a leitura ser mais espaçada no tempo
}
