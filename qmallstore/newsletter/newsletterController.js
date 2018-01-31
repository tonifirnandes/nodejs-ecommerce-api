var newsletterModel = require('../newsletter/newsletterModel');
var messages = require('../../configuration/MESSAGE');

exports.newsletterList = function(call, callback) {
    newsletterModel.getNewsletter(call, function(err, result) {
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