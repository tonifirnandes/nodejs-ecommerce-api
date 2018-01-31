app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.searchByBrandNoLimit = function(query, callback) {
    db.query('SELECT * FROM product INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId WHERE productPartNumber like "%' + query.searchingkey + '%" AND product.productBrandId = ' + query.productbrandid + '', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};

exports.searchAllProductNoLimit = function(query, callback) {
    db.query('SELECT * FROM product INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId WHERE productPartNumber like "%' + query.searchingkey + '%"', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};