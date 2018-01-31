app = require('../../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getProductByCategory = function(query, callback) {
    db.query('SELECT * from product WHERE productCategoryId = (' + query.productCategoryId + ')', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};