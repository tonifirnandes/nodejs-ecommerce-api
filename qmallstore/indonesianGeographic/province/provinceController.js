var provinceModel = require('../province/provinceModel');
var messages = require('../../../configuration/MESSAGE');

exports.provinceList = function(call, callback) {
    provinceModel.getProvince(call, function(err, result) {
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

}