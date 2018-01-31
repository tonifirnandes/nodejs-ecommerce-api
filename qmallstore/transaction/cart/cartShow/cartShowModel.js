app = require('../../../../indexApps');
var moment = require('moment');
var groupArray = require('group-array');
var math = require('mathjs');
var date = require('date-and-time');
db = app.db;

exports.checkingSessionToken = function(query, callback) {
    db.query('SELECT * FROM customer_session WHERE customerEmail = "' + query.email + '" OR customerPhoneNumber = "' + query.email + '"', function(err, rowsSession, fields) {
        if (err)
            callback(err, null);
        else {
            if (rowsSession.length > 0) {
                if (query.sessiontoken === rowsSession[0].customerToken) {
                    callback(null, { code: 9000, messages: "masih login", rowsSession });
                    console.log(rowsSession);
                } else {
                    callback(null, { code: 9001, messages: "Silahkan Login atau hubungi admin untuk melanjutkan transaksi" });
                }
            } else {
                callback(null, { code: 9001, messages: "Silahkan Login atau hubungi admin untuk melanjutkan transaksi" });
            }
        }
    });
};

exports.showCartCustomer = function(query, callback) {
    var querySelectCart = "SELECT * FROM cart_item " +
        "INNER JOIN cart ON cart_item.cartId = cart.cartId " +
        "INNER JOIN product ON cart_item.productId = product.productId " +
        "INNER JOIN customer_account ON cart.customerEmail = customer_account.customerEmail " +
        "INNER JOIN customer_address ON customer_address.customerEmail = customer_account.customerEmail " +
        "INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId " +
        "INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId " +
        "INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId " +
        "INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId " +
        "INNER JOIN product_price ON product_price.productId = product.productId " +
        "WHERE customer_account.customerEmail = '" + query.customerEmail + "'";
    db.query(querySelectCart, function(err, rowsSelectCart, fields) {
        if (err)
            callback(err, null);
        else {
            var rowsSelectCartGroup = groupArray(rowsSelectCart, "cartId");
            callback(null, rowsSelectCartGroup);
        }
    });
};