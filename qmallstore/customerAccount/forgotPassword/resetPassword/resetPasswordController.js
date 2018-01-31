var resetPasswordModel = require('../resetPassword/resetPasswordModel');
var messages = require('../../../../configuration/MESSAGE');

exports.resetPassword = function(call, callback) {
    if (call.password != null || call.customerForgotPasswordCode != null) {
        resetPasswordModel.resetPassword(call, function(err, resulted) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                if (resulted.code === 8000) {
                    callback(null, resulted)
                } else if (resulted.code === 8005) {
                    callback(null, resulted)
                } else {
                    callback(null, { code: 8001, messages: "verify code incorrect" })
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}