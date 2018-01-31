var promoModel = require('../promo/promoModel');
var messages = require('../../../configuration/MESSAGE');

exports.promoList = function(call, callback) {
    promoModel.getPromo(call, function(err, result) {
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