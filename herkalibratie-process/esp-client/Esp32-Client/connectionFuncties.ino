String ESPID = "1";

//Connect to wifi -------------------------------------------------

void connectWifi() {
  // Connect to wifi
  WiFi.begin("Thijmenland", "Tvr1eK0Y2ruSqdFSgb7x");
  //WiFi.begin("laptop_thijmen", "12345678");

  // Wait some time to connect to wifi
  for (int i = 0; i < 10 && WiFi.status() != WL_CONNECTED; i++) 
  {
    Serial.print(".");
    delay(1000);
  }

  // Check if connected to wifi
  if (WiFi.status() != WL_CONNECTED) 
  {
    Serial.println("No Wifi!");
    return;
  }

  Serial.print("Connected to Wifi"); 
}

//Connect to wifi bottom -----------------------------------------


//connect to websocket ------------------------------------------

void connectSocket() {
  String server = "ws://www.superoute.nl?ID=ESP1";
  int port = 80;
  String path = "/";

  Serial.print("Connecting to WebSockets Server @");
  Serial.println(server);

  // run callback when events are occuring
  client.onEvent(onEventsCallback);
  
  // try to connect to Websockets server
  bool connected = client.connect("ws://www.superoute.nl?ID=1");
  
  if (connected) 
  {
    Serial.println("Connected!");
    String initial="{\"client\":\"ESP32\",\"data\":\"initial_connection\"}";
    client.send(initial);
  } 
  else 
  {
    Serial.println("Not Connected!");
  }
}

//Connect to websocket end ---------------------------------------


//on websocket calback -------------------------------------------

void onEventsCallback(WebsocketsEvent event, String data) 
{
  (void) data;
  
  if (event == WebsocketsEvent::ConnectionOpened) 
  {
    Serial.println("Connnection Opened");
  } 
  else if (event == WebsocketsEvent::ConnectionClosed) 
  {
    Serial.println("Connnection Closed");
  } 
  else if (event == WebsocketsEvent::GotPing) 
  {
    Serial.println("Got a Ping!");
  } 
  else if (event == WebsocketsEvent::GotPong) 
  {
    Serial.println("Got a Pong!");
  }
}

//on websocket callback end -------------------------------------
