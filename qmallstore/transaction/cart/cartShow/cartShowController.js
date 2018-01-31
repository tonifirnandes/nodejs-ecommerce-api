var cartShowModel = require('../cartShow/cartShowModel');
var messages = require('../../../../configuration/MESSAGE');


exports.checkingHeaderSession = function(call, callback) {
    cartShowModel.checkingSessionToken(call, function(err, resultSession) {
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

exports.showCart = function(call, callback) {
    if (call.customerEmail != null) {
        cartShowModel.showCartCustomer(call, function(err, resultCartShow) {
            if (err) {
                callback(err, null);
            } else {
                callback(null, { code: 4030, messages: "Anda berhasil menampilkan cart!", data: resultCartShow });
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}