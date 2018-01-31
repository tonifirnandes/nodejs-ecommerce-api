var registerModel = require('../register/registerModel');
var messages = require('../../../configuration/MESSAGE');

exports.registerEmail = function(call, callback) {
    if (call.email !== null && call.password !== null && call.confirmPassword !== null && call.phoneNumber !== null && call.registerUri !== null) {
        registerModel.customerAccountCheck(call, function(err, resulted) {
            if (err) {
                callback(err, null);
            } else {
                if (resulted.ada) {
                    callback(null, { code: 2002, messages: "Anda sudah terdaftar!" })
                } else {
                    registerModel.customerEmailCheck(call, function(err, resulteded) {
                        if (err) {
                            callback(err, null);
                        } else {
                            if (resulteded.ada) {
                                callback(null, { code: 2001, messages: "back to OTP Code page" })
                            } else {
                                registerModel.registerCustomerEmail(call, function(err, result) {
                                    if (err) {
                                        callback(err, null);
                                    } else {
                                        callback(null, { code: 2000, messages: "register success!", data: result });
                                    }
                                });
                            }
                        }
                    });

                }
            }
        });

    } else {
        callback(null, messages.parameter_not_completed);
    }
}