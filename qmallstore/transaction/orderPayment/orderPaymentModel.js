app = require('../../../indexApps');
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

exports.addOrderPayment = function(query, callback) {
    db.query('SELECT * FROM order_payment WHERE orderId = ' + query.orderId, function(err, checkOrderIdInOrderPayment, fields) {
        if (err)
            callback(err, null);
        else {
            if (checkOrderIdInOrderPayment.length > 0) {
                callback(null, { code: 8301, messages: "Data order payment sudah tersedia" });
            } else {
                var paymentDate = new Date();
                var postaddOrderPayment = {
                    paymentDate: paymentDate,
                    orderId: query.orderId,
                    paymentReferenceId: query.paymentReferenceId
                };
                db.query('INSERT INTO order_payment set ? ', postaddOrderPayment, function(err, rowsaddOrderPayment, fields) {
                    if (err) callback(err, null);
                    else {
                        callback(null, rowsaddOrderPayment);
                    }
                });
            }
        }
    });

};