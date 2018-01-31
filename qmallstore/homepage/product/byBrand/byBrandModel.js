app = require('../../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getProductByBrand = function(query, callback) {
    db.query('SELECT * from product WHERE productBrandId = (' + query.productBrandId + ')', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};