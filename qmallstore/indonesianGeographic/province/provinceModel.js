app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getProvince = function(query, callback) {
    db.query('SELECT * from indonesian_province', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};