app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getPromo = function(query, callback) {
    db.query('SELECT * FROM product INNER JOIN product_promo ON product_promo.productId = product.productId', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};