var subscribeEmailModel = require('../subcribe/subcribeEmailModel');
var messages = require('../../configuration/MESSAGE');

exports.InsertSubscribeEmail = function(call, callback) {
    if (call.email != null) {
        subscribeEmailModel.emailCheck(call, function(err, resulted) {
            if (err) {
                callback(err, null);
            } else {
                if (resulted.ada) {
                    callback(null, { code: 1000, messages: "Anda sudah terdaftar!" })
                } else {
                    subscribeEmailModel.insertSubscribeEmail(call, function(err, result) {
                        if (err) {
                            callback(err, null);
                        } else {
                            callback(null, { code: 1001, messages: "Anda berhasil mendaftar!", data: result });
                        }
                    });
                }
            }
        });

    } else {
        callback(null, messages.parameter_not_completed);
    }
}