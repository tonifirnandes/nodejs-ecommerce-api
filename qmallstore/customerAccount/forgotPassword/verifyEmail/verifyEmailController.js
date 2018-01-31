var emailCheckForgotPasswordModel = require('../verifyEmail/verifyEmailModel');
var messages = require('../../../../configuration/MESSAGE');

exports.emailCheckForgotPassword = function(call, callback) {
    if (call.email != null || call.forgetPasswordUri != null) {
        emailCheckForgotPasswordModel.EmailForgotPassword(call, function(err, resulted) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                if (resulted.code === 7000) {
                    callback(null, resulted)
                } else if (resulted.code === 7005) {
                    callback(null, resulted)
                } else {
                    callback(null, { code: 7001, messages: "TIdak ada email" })
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}