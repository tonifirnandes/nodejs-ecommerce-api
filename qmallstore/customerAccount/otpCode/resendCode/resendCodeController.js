var resendCodeModel = require('../resendCode/resendCodeModel');
var messages = require('../../../../configuration/MESSAGE');

exports.resendCode = function(call, callback) {
    if (call.emailCode != null) {
        resendCodeModel.limitCheck(call, function(err, resulted) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                if (resulted.resendok) {
                    resendCodeModel.updateOtpCode(call, function(err, resulteded) {
                        if (err) {
                            callback(err, null);
                        } else {
                            callback(null, { code: 5000, messages: "bisa recode1" });
                        }
                    });
                } else if (resulted.resendafter) {
                    resendCodeModel.updateOtpCodeAfter(call, function(err, resulteded) {
                        if (err) {
                            callback(err, null);
                        } else {
                            callback(null, { code: 5001, messages: "bisa recode2" });
                        }
                    });
                } else {
                    callback(null, { code: 5002, messages: "recode limit" })
                }
            }
        });

    } else {
        callback(null, messages.parameter_not_completed);
    }
}