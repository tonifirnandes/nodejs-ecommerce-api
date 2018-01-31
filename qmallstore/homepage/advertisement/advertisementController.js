var advertisementModel = require('../advertisement/advertisementModel');
var messages = require('../../../configuration/MESSAGE');

exports.advertisementList = function(call, callback) {
    advertisementModel.getadvertisement(call, function(err, result) {
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