app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.partNumberName = function(query, callback) {
    db.query('SELECT productPartNumber from product WHERE productPartNumber like "%' + query.searchingkey + '%"', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};