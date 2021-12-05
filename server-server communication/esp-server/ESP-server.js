"use strict";

 //server variables
const host = '0.0.0.0';
const serverPort = 8000;

//get packages
const http = require("http");
const express = require("express");

//init server
const app = express();
const server = http.createServer(app);
const WebSocket = require("ws");
const websocketServer = new WebSocket.Server({ server });

//when a websocket connection is established
websocketServer.on('connection', (webSocketClient) => {
    //send feedback to the incoming connection
    webSocketClient.send('{ "connection" : "ok"}');
    
    //when a message is received
    webSocketClient.on('message', (message) => {
        let json = JSON.parse(message);
        let clientDevice = json['client'];
        let data = json['data'];

        //for each websocket client
        websocketServer
        .clients
        .forEach( client => {
            if (client !== webSocketClient && client.readyState === WebSocket.OPEN) {
                //send the client the current message
                client.send(`{"client":"${clientDevice}":"data":"${data}"}`);
            }
        });
    });
});

//start the web server
server.listen(serverPort, host, () => {
    console.log(`Websocket server started on port ` + serverPort);
});