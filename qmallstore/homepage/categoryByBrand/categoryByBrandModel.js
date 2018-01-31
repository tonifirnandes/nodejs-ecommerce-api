app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getCategoryByBrand = function(query, callback) {
    db.query('SELECT product_brand.productBrandId, product_category.productCategoryDescription, product_category.productCategoryImage FROM product_brand INNER JOIN product_brand_category ON product_brand_category.productBrandId = product_brand.productBrandId INNER JOIN product_category ON product_brand_category.productCategoryId = product_category.productCategoryId WHERE product_brand.productBrandId = (' + query.brandId + ')', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};