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

exports.addOrderShipment = function(query, callback) {
    db.query('SELECT * FROM order_shipment WHERE orderId = ' + query.orderId, function(err, checkOrderShipment, fields) {
        if (err)
            callback(err, null);
        else {
            if (checkOrderShipment.length > 0) {
                callback(null, { code: 8301, messages: "Data order shipment sudah tersedia" });
            } else {
                db.query('SELECT * FROM `order` WHERE orderId = ' + query.orderId, function(err, selectProductWeightFull, fields) {
                    if (err)
                        callback(err, null);
                    else {
                        if (selectProductWeightFull.length > 0) {
                            var paymentDate = new Date();
                            var postOrderShipment = {
                                orderId: query.orderId,
                                shipmentPriceItem: query.shipmentPriceItem,
                                shipmentReferenceId: query.shipmentReferenceId,
                                shipmentFullPrice: query.shipmentPriceItem * selectProductWeightFull[0].orderProductWeightFull
                            };
                            console.log(selectProductWeightFull[0].orderProductWeightFull);
                            db.query('INSERT INTO order_shipment set ? ', postOrderShipment, function(err, rowsAddOrderShipment, fields) {
                                if (err) callback(err, null);
                                else {
                                    callback(null, rowsAddOrderShipment);
                                }
                            });
                        } else {
                            callback(null, { messages: "data null" });
                        }
                    }
                });

            }
        }
    });

};