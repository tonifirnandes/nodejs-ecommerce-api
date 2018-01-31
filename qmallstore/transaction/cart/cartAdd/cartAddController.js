var cartAddModel = require('../cartAdd/cartAddModel');
var messages = require('../../../../configuration/MESSAGE');


exports.checkingHeaderSession = function(call, callback) {
    cartAddModel.checkingSessionToken(call, function(err, resultSession) {
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

exports.addCartCustomer = function(call, callback) {
    if (call.customerEmail != null &&
        call.productId != null &&
        call.cartItemQuantity != null &&
        call.productPrice != null &&
        call.cartItemProductPriceType != null &&
        call.cartItemProductPriceStatus != null) {
        cartAddModel.insertCartCustomer(call, function(err, resultCartAdd) {
            if (err) {
                callback(err, null);
            } else {
                callback(null, { code: 2030, messages: "Anda berhasil menambahkan cart!", data: resultCartAdd });
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}