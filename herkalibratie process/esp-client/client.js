//import libs
const websocket = require('ws');
let herkalibratie = false;
let schapmodus = true;
let host_client = "ESP";
let bericht = "no data yet";
let client = "unknown";
let i = 0;

const url = 'ws://192.168.128.29:8000';
const connection = new websocket(url);

connection.onopen = () => {
    connection.send(`{"client":"${host_client}", "data":"initial connection"}`);
}

connection.onmessage = e => {
    if(IsJsonString(e.data)) {
        console.log(bericht);

        let json = JSON.parse(e.data);
        bericht = json['data'];
        client = json['client'];
        console.log(e.data);
    }

    if(bericht === 'herkalibratie') {
        herkalibratie = true;
        schapmodus = false;
        setInterval(function(){
            herkal();
        },1000)
    } 
    if(bericht == 'finished') {
        schapmodus = true;
        herkalibratie = false;
        schap();
    }
    
    console.log(bericht);
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
                console.log(bericht);
                console.log(herkalibratie);
                i++
    } else {
        connection.send(`{"client":"${host_client}", "data":"schap modus"}`);
    }
}

function schap() {
    if(schapmodus) {
        connection.send(`{"client":"${host_client}", "data":"schap modus"}`);
        console.log(bericht);
    } else {
        bericht = '';
        return;
    }
}