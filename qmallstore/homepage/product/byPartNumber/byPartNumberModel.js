app = require('../../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getProductByPartNumber = function(query, callback) {
    db.query('SELECT * from product WHERE productPartNumber = (' + query.productPartNumberId + ')', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};