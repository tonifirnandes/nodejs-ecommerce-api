var faqDislikeModel = require('../faqDislike/faqDislikeModel');
var messages = require('../../../configuration/MESSAGE');

exports.faqDislike = function(call, callback) {
    if (call.faqId != null) {
        faqDislikeModel.updateFaqDislike(call, function(err, result) {
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