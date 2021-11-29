//HTTP handlers
const express = require('express');
const router = require('./routes');


//create express app
var app = express();
const port = 8000;
const host = '0.0.0.0';

app.use(express.json())

app.use('/', router)

//Endpoit om winkels op te vragen
//Endpoint om op basis van winkel alle data op te vragen

//Initialize server
app.listen(port, host, () => {
    console.log(`Server is listening on port ${port}`);
});