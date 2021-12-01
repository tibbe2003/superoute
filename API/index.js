//HTTP handlers
const express = require('express');
const https = require('https')
const router = require('./routes');
const fs = require('fs');

//ssl
const key = fs.readFileSync('./key.pem');
const cert = fs.readFileSync('./cert.pem');

//create express app
const app = express();
const port = 8000;
const host = '0.0.0.0';

app.use(express.json())

app.use('/api', router)

//Endpoit om winkels op te vragen
//Endpoint om op basis van winkel alle data op te vragen

//Initialize server
https.createServer({
    key: key,
    cert: cert
}, app).listen(port, host, () => {
    console.log(`Superroute is listening on port ${port}`);
})