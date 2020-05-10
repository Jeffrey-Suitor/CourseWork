#include "BluetoothSerial.h"

BluetoothSerial ESP_BT;

int RED_PIN = 19;
int GREEN_PIN = 22;
int BLUE_PIN = 21;
int TOE_PIN = 35;
int HEEL_PIN = 34;
int EMG_PIN = 37;

String message;
char incoming;

const int array_len = 3;
int output_array[array_len];

void setup() {
  Serial.begin(9600);
  pinMode(RED_PIN, OUTPUT);
  pinMode(GREEN_PIN, OUTPUT);
  pinMode(BLUE_PIN, OUTPUT);
  pinMode(HEEL_PIN, INPUT);
  pinMode(TOE_PIN, INPUT);

  digitalWrite(RED_PIN, LOW);
  digitalWrite(GREEN_PIN, LOW);
  digitalWrite(BLUE_PIN, LOW);
  ESP_BT.begin("OOF.png");  // This line is what breaks the force resistors

}

void display_green() {
  // Write only the green pin high
  digitalWrite(RED_PIN, LOW);
  digitalWrite(GREEN_PIN, HIGH);
  digitalWrite(BLUE_PIN, LOW);
}

void display_red() {
  // Write only the red pin high
  digitalWrite(RED_PIN, HIGH);
  digitalWrite(GREEN_PIN, LOW);
  digitalWrite(BLUE_PIN, LOW);
}

void display_blue() {
  // Write only the red pin high
  digitalWrite(RED_PIN, LOW);
  digitalWrite(GREEN_PIN, LOW);
  digitalWrite(BLUE_PIN, HIGH);
}

void display_none() {
  // Write only the red pin high
  digitalWrite(RED_PIN, LOW);
  digitalWrite(GREEN_PIN, LOW);
  digitalWrite(BLUE_PIN, LOW);
}

String create_packet(int sensor_readings[array_len]) {

  String outgoing_packet = "";

  for (int i = 0; i < array_len; i++) {
    outgoing_packet += sensor_readings[i];
    outgoing_packet += "|";
  }
  
  for (int i = outgoing_packet.length(); i < (array_len)*5; i++) {
    outgoing_packet += 0;
  }
  return outgoing_packet;
}

void loop() {
  int toe_force = analogRead(TOE_PIN);
  int heel_force = analogRead(HEEL_PIN);
  int emg = analogRead(EMG_PIN);

  output_array[0] = toe_force;
  output_array[1] = heel_force;
  output_array[2] = emg;

  String outgoing_message = create_packet(output_array);

  Serial.println(outgoing_message);
  ESP_BT.print(outgoing_message);

  if (ESP_BT.available() > 0) //Check if we receive anything from Bluetooth
  {
    incoming = ESP_BT.read();
    
    if (incoming == '\n') {
      message.toUpperCase();
      message.trim();


      if (message == "GREEN") {
        display_green();
      }
      else if (message == "RED") {
        display_red();
      }

      else if (message == "BLUE") {
        display_blue();
      }

      else if (message == "NONE"){
        display_none();
      }

      Serial.println(message);
      message = "";

    }
    else {
      message += incoming;
    }
  }
}
