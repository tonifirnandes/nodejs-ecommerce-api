/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'tonifirnandes@mysql',
    database: 'qmall_api_dev'
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