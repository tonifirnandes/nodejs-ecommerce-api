var productInfoModel = require('../productInfo/productInfoModel');
var messages = require('../../../configuration/MESSAGE');


exports.checkingHeaderSession = function(call, callback) {
    productInfoModel.checkingSessionToken(call, function(err, resulted) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            if (resulted.code === 9000) {
                callback(null, resulted)
            } else {
                callback(null, resulted)
            }
        }
    });
}
exports.productInfoLogin = function(call, callback) {
    if (call.productId != null && call.productBrandId != null) {
        productInfoModel.productInfoLoginList(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                if (result.code === 2010) {
                    callback(null, result);
                } else {
                    callback(null, messages.user_not_found);
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}

exports.productInfoNoLogin = function(call, callback) {
    if (call.productId != null && call.productBrandId != null) {
        productInfoModel.productInfoNoLoginList(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                if (result.code === 2010) {
                    callback(null, result);
                } else {
                    callback(null, messages.user_not_found);
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}