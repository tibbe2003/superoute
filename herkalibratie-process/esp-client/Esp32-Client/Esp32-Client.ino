#include "defines.h"
#include <WebSockets2_Generic.h>
#include <WiFi.h>
#include <ArduinoJson.h>
using namespace websockets2_generic;
WebsocketsClient client;

int counter = 0;
String stand = "schap";

volatile int count;    // Trigger 
int totalInterrupts;

hw_timer_t * timer = NULL;
portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;

// Code with critica section
void IRAM_ATTR onTime() {
   portENTER_CRITICAL_ISR(&timerMux);
   count++;
   portEXIT_CRITICAL_ISR(&timerMux);
}


void setup()
{
  Serial.begin(115200);
  while (!Serial);

  connectWifi(); //Connect to wifi - connectionFunctions.ino
  
  connectSocket(); //Connect to websocket server = connectionFunction.ino

  // run callback when messages are received
  client.onMessage([&](WebsocketsMessage message) {
    Serial.print("Got Message: ");
    Serial.println(message.data());
    stand = parseJson(message.data());
  });

  timer = timerBegin(0, 80, true);                
  timerAttachInterrupt(timer, &onTime, true);    
  timerAlarmWrite(timer, 1000000, true);           
  timerAlarmEnable(timer);
}

void loop() 
{
  String stringNieuwAantalOpSchap = String(counter);
  String PostData="{\"client\":\"ESP32\",\"data\":"+stringNieuwAantalOpSchap+",\"target\":\"app\"}";

  // let the websockets client check for incoming messages
  if (client.available())
  {
    client.poll();
  }
  
  if(stand == "schap") {
    client.send("{\"client\":\"ESP32\",\"data\":\"Schap modus\",\"target\":\"app\"}");
    counter = 0;
    stand = "";
  } else if (stand == "herkal") {
    if (count > 0) {
       portENTER_CRITICAL(&timerMux);
       count--;
       portEXIT_CRITICAL(&timerMux);

       counter++;

       client.send(PostData);
    } 
  }


  //delay(500);
}
