var regencyModel = require('../regency/regencyModel');
var messages = require('../../../configuration/MESSAGE');

exports.regencyList = function(call, callback) {
    if (call.provinceId != null) {
        regencyModel.getRegency(call, function(err, result) {
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