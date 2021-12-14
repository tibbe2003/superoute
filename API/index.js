//HTTP handlers
const express = require('express');
const router = require('./routes');

//create express app
const app = express();
const port = 8000;
const host = '0.0.0.0';

app.use(express.json())

app.use('/', router);
  
  app.listen(port, host, () => {
    console.log(`api server listening at http://api.superoute.nl:${port}`)
  })