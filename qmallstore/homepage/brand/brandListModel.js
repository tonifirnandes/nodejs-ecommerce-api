app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getBrandList = function(query, callback) {
    db.query('SELECT * from product_brand', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};