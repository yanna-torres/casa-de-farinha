// Sensor: https://www.tinkercad.com/things/fRfyrjmQbRj-copy-of-16-sensor-de-proximidade/editel?tenant=circuits
// RFID: https://www.arduinoecia.com.br/leitor-rfid-rdm6300-125khz-arduino/#google_vignette

// // RFID Setup
#include <SoftwareSerial.h>
#include <RDM6300.h>

//Inicializa a serial nos pinos 2 (RX) e 3 (TX)
SoftwareSerial RFID(2, 3);

int Led = 13;
uint8_t Payload[6];  // used for read comparisons

RDM6300 RDM6300(Payload);

// // Sensor Setup

#define trigger 4
#define echo 5

void setup() {
  pinMode(Led, OUTPUT);
  RFID.begin(9600);
  Serial.begin(9600);
  pinMode(trigger, OUTPUT);
  pinMode(echo, INPUT);
}

void loop() {
  int tela = -1;
  long distanciaCm = sensor();
  int id = rfid();
  if (distanciaCm < 5 && distanciaCm > 0) {
    tela = 0;
  } else if (id != 0) {
    tela = id;
  } else {
    tela = -1;
  }

  if (tela != -1) {
    Serial.print("TELA: ");
    Serial.println(tela);
  }

  delay(1000);  // Adiciona um atraso para a leitura ser mais espaçada no tempo
}

long sensor() {
  digitalWrite(trigger, LOW);
  delayMicroseconds(2);
  digitalWrite(trigger, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigger, LOW);

  long duracao = pulseIn(echo, HIGH);
  long distanciaCm = (duracao / 2) * 0.0343;
  return distanciaCm;
}

int rfid() {

  int id = 0;
  //Aguarda a aproximacao da tag RFID
  while (RFID.available() > 0) {
    digitalWrite(Led, HIGH);
    uint8_t c = RFID.read();
    if (RDM6300.decode(c)) {
      String a = "";
      //Mostra os dados no serial monitor
      for (int i = 0; i < 5; i++) {
        a += String(Payload[i], HEX);
        a += " ";
      }  // Variável para armazenar o valor correspondente ao ID da tag RFID

      // Verifica o valor de 'a' e atribui o valor correto a 'id'
      if (a == "39 0 22 4b d1 ") {
        id = 1;
      } else if (a == "a0 72 5a c8 5a ") {
        id = 2;
      } else if (a == "a0 72 7a 19 38 ") {
        id = 4;
      } else if (a == "a0 72 5a c8 25 ") {
        id = 5;
      } else {
        id = 0;
      }
    }
  }
  digitalWrite(Led, LOW);
  delay(100);

  return id;
}
