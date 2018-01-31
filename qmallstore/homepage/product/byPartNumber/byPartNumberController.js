var byPartNumberModel = require('../byPartNumber/byPartNumberModel');
var messages = require('../../../../configuration/MESSAGE');

exports.productByPartNumberList = function(call, callback) {
    if (call.productPartNumberId != null) {
        byPartNumberModel.getProductByPartNumber(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                if (result[0]) {
                    callback(null, result);
                } else {
                    callback(null, messages.product_not_found);
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}