/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// var db = require('mysql-promise')();

// db.configure({
//     "host": "192.168.88.100",
//     "user": "root",
//     "password": "13qeadzc",
//     "database": "stg_db_qmall"
// });

var mysql = require('mysql');
var connection = mysql.createConnection({
    host: '192.168.88.100',
    user: 'root',
    password: '13qeadzc',
    database: 'stg_db_qmall'
});

exports.connect = function(callback) {
    connection.connect((err) => {
        if (err) {
            callback(err, null);
            console.log('connection error!');
        } else {
            callback(null, connection);
            console.log('Connected!');
        }

    });
}