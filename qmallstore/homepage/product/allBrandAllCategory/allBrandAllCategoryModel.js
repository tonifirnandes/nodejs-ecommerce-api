app = require('../../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getAllBrandAllCategory = function(query, callback) {
    db.query('SELECT *' +
        'FROM product_brand_category INNER JOIN product_brand ON product_brand_category.productBrandId = product_brand.productBrandId INNER JOIN product_category ON product_brand_category.productCategoryId = product_category.productCategoryId ',
        function(err, rows, fields) {
            if (err)
                callback(err, null);
            else
                callback(null, rows);
            console.log(rows);
        });
};