// Json parsing ----------------------------------------------
String parseJson(String message) {
  StaticJsonDocument<400> doc;                        //Memory pool
  deserializeJson(doc, message); //Parse message

  return doc["data"];
}
// Json parsing end -------------------------------------------
