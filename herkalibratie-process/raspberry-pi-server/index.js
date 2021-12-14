"use strict";

//server variables
const host = '0.0.0.0';
const serverPort = 8080;

//get packages
const http = require("http");
const express = require("express");

//init server
const app = express();
const server = http.createServer(app);
const WebSocket = require("ws");
const { json } = require("express/lib/response");
const websocketServer = new WebSocket.Server({ server });

let connectedClients = [];

websocketServer.on('connection', (webSocketClient, req) => {
    if(!getId(req.url)) webSocketClient.close();

    connectedClients.push({id: getId(req.url), client: webSocketClient});
    webSocketClient.send('{"connection":"ok"}');

    webSocketClient.on('message', (message) => {
        let target = "unknown";
        let clientDevice = "server";
        let data = "error";
        if(IsJsonString(message)) {
            let json = JSON.parse(message);

            target = json['target'];
            clientDevice = json['client'];
            data = json['data'];

        }

        let Client = connectedClients.find(x => x.id == target);
        if(Client != undefined) Client = Client.client;

        if(Client != undefined) {
            Client.send("this is for the client");
        } else {
            console.log("client is unknown");
        }
   });
});

server.listen(serverPort, host, () => {
   console.log(`Websocket server started on port ` + serverPort);
});

function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

function getId(Id) {
    Id = Id.split('=');
    if(Id[0] != '/?ID') {
        return false;
    }
    return Id[1];
}