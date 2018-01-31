var byBrandModel = require('../byBrand/byBrandModel');
var messages = require('../../../../configuration/MESSAGE');

exports.productByBrandList = function(call, callback) {
    if (call.productBrandId != null) {
        byBrandModel.getProductByBrand(call, function(err, result) {
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