var villageModel = require('../village/villageModel');
var messages = require('../../../configuration/MESSAGE');

exports.villageList = function(call, callback) {
    if (call.districtId != null) {
        villageModel.getVIllage(call, function(err, result) {
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