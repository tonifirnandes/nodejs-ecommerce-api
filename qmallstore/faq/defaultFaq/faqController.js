var faqModel = require('../defaultFaq/faqModel');
var messages = require('../../../configuration/MESSAGE');

exports.faqList = function(call, callback) {
    faqModel.getFaq(call, function(err, result) {
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