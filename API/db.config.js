'use strict';

const mysql = require('mysql');

//DB variables
const conn = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "superroute",
    database: "superroute"
});

conn.connect(function(err) {
    if(err) throw err;
    console.log("Database connected");
})

module.exports = conn;
