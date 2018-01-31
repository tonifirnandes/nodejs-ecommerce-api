app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.searchProductByPartNumber = function(query, callback) {
    db.query('SELECT * from product WHERE productPartNumber like "%' + query.searchingkey + '%"', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};