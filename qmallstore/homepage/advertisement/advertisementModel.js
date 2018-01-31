app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getadvertisement = function(query, callback) {
    db.query('SELECT * from advertisement', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};