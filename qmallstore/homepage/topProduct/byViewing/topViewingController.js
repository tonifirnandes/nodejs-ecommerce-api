var topViewingModel = require('../byViewing/topViewingModel');
var messages = require('../../../../configuration/MESSAGE');

exports.checkingHeaderSession = function(call, callback) {
    topViewingModel.checkingSessionToken(call, function(err, resulted) {
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
exports.topViewingListLogin = function(call, callback) {
    if (call.productBrandId != null) {
        topViewingModel.getTopViewingLogin(call, function(err, result) {
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
exports.topViewingListNoLogin = function(call, callback) {
    if (call.productBrandId != null) {
        topViewingModel.getTopViewingNoLogin(call, function(err, result) {
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