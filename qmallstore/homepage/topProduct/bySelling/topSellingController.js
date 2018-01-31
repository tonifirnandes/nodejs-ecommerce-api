var topSellingModel = require('../bySelling/topSellingModel');
var messages = require('../../../../configuration/MESSAGE');

exports.checkingHeaderSession = function(call, callback) {
    topSellingModel.checkingSessionToken(call, function(err, resulted) {
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
exports.topSellingListLogin = function(call, callback) {
    if (call.productBrandId != null) {
        topSellingModel.getTopSellingLogin(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                if (result[0]) {
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
exports.topSellingListNoLogin = function(call, callback) {
    if (call.productBrandId != null) {
        topSellingModel.getTopSellingNoLogin(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                if (result[0]) {
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