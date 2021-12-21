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
    let senderClient = getId(req.url);

    connectedClients.push({id: senderClient, client: webSocketClient});
    console.log("New client connected under the id: "+senderClient);
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

        console.log(target);

        let Client = connectedClients.find(x => x.id == target);
        if(Client != undefined) Client = Client.client;

        if(Client != undefined) {
            Client.send(`{"client":"${senderClient}","data":"${data}"}`);
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