//import libs
const websocket = require('ws');
let herkalibratie = false;
let schapmodus = true;
let host_client = "ESP";
let bericht = "no data yet";
let client = "unknown";
let i = 0;

const url = 'ws://localhost:8000';
const connection = new websocket(url);

connection.onopen = () => {
    connection.send(`{"client":"${host_client}", "data":"initial connection"}`);
}

connection.onmessage = e => {
    console.log(e.data);
    if(IsJsonString(e.data)) {
        let json = JSON.parse(e.data);
        bericht = json['data'];
        client = json['client'];
    } else {
        console.log("error");
    }

    if(bericht === 'herkalibratie') {
        i = 0;
        herkalibratie = true;
        schapmodus = false;
        setInterval(function(){
            herkal();
        },1000)
    } 
    if(bericht == 'finished') {
        i = 0;
        schapmodus = true;
        herkalibratie = false;
        schap();
    }
    if(bericht == 'latest') {
        schapmodus = false;
        herkalibratie = false;
        bericht = '';
        console.log(`{"client":"${host_client}", "data":"${i}"}`);
        connection.send(`{"client":"${host_client}", "data":"${i}"}`);
    }
}

function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

function herkal() {
    if(herkalibratie === true && schapmodus === false && bericht == 'herkalibratie') {
                connection.send(`{"client":"${host_client}", "data":"${i}"}`);
                console.log(i);
                i++
    } else {
        connection.send(`{"client":"${host_client}", "data":"schap modus"}`);
    }
}

function schap() {
    if(schapmodus) {
        i = 0;
        connection.send(`{"client":"${host_client}", "data":"schap modus"}`);
    } else {
        bericht = '';
        return;
    }
}