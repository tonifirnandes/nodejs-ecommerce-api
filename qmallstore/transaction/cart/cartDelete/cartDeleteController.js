var cartDeleteModel = require('../cartDelete/cartDeleteModel');
var messages = require('../../../../configuration/MESSAGE');

exports.checkingHeaderSession = function(call, callback) {
    cartDeleteModel.checkingSessionToken(call, function(err, resultSession) {
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

exports.deleteCart = function(call, callback) {
    if (call.cartId != null && call.productId != null) {
        cartDeleteModel.deleteCartItem(call, function(err, resultCartDelete) {
            if (err) {
                callback(err, null);
            } else {
                callback(null, { code: 4031, messages: "delete berhasil!" });
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}