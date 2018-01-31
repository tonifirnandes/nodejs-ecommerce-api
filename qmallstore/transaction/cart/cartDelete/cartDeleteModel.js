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

exports.deleteCartItem = function(query, callback) {
    var queryDeleteCartItem = "DELETE FROM cart_item " +
        "WHERE cartId = " + query.cartId + " AND productId = " + query.productId;
    console.log(queryDeleteCartItem);
    db.query(queryDeleteCartItem, function(err, rowsdeleteCart, fields) {
        if (err)
            callback(err, null);
        else {
            callback(null, rowsdeleteCart);
        }
    });
};