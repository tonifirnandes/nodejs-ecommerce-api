var productAllModel = require('../allProduct/allProductModel');
var messages = require('../../../../configuration/MESSAGE');

exports.productAllList = function(call, callback) {
    productAllModel.getProductAll(call, function(err, result) {
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