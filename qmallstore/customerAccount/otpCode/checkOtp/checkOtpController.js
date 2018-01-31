var checkOtpModel = require('../checkOtp/checkOtpModel');
var messages = require('../../../../configuration/MESSAGE');

exports.checkOtp = function(call, callback) {
    if (call.emailCode != null && call.otpCode != null) {
        checkOtpModel.otpCodeCheck(call, function(err, resulted) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                if (resulted.expired) {
                    callback(null, { code: 3000, messages: "OTP Expired!" })
                } else if (resulted.ada) {
                    callback(null, { code: 3001, messages: "OTP Verified!" })
                } else {
                    callback(null, { code: 3002, messages: "OTP Salah!" })
                }
            }
        });

    } else {
        callback(null, messages.parameter_not_completed);
    }
}