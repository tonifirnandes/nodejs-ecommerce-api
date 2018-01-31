var orderShipmentModel = require('../orderShipment/orderShipmentModel');
var messages = require('../../../configuration/MESSAGE');


exports.checkingHeaderSession = function(call, callback) {
    orderShipmentModel.checkingSessionToken(call, function(err, resultSession) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                callback(null, resultSession)
            } else {
                callback(null, resultSession)
            }
        }
    });
}

exports.addOrderShipmentDetail = function(call, callback) {
    if (call.orderId != null && call.shipmentPriceItem != null && call.shipmentReferenceId != null) {
        orderShipmentModel.addOrderShipment(call, function(err, resultaddOrderShipmentDetail) {
            if (err) {
                callback(err, null);
            } else {
                if (resultaddOrderShipmentDetail.code === 8301) {
                    callback(null, { code: 8301, messages: "order shipment tersedia!" });
                } else {
                    callback(null, { code: 8300, messages: "Anda berhasil menambahkan order shipment!", data: resultaddOrderShipmentDetail });
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}