var orderPaymentModel = require('../orderPayment/orderPaymentModel');
var messages = require('../../../configuration/MESSAGE');


exports.checkingHeaderSession = function(call, callback) {
    orderPaymentModel.checkingSessionToken(call, function(err, resultSession) {
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

exports.addOrderPaymentDetail = function(call, callback) {
    if (call.orderId != null && call.paymentReferenceId != null) {
        orderPaymentModel.addOrderPayment(call, function(err, resultaddOrderPaymentDetail) {
            if (err) {
                callback(err, null);
            } else {
                if (resultaddOrderPaymentDetail.code === 8301) {
                    callback(null, { code: 8301, messages: "order payment tersedia!" });
                } else {
                    callback(null, { code: 8300, messages: "Anda berhasil menambahkan order payment!", data: resultaddOrderPaymentDetail });
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}