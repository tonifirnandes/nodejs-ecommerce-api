app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getFaq = function(query, callback) {
    db.query('SELECT * from faq', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};