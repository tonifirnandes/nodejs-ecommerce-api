var districtModel = require('../district/districtModel');
var messages = require('../../../configuration/MESSAGE');

exports.districtList = function(call, callback) {
    if (call.regencyId != null) {
        districtModel.getdistrict(call, function(err, result) {
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