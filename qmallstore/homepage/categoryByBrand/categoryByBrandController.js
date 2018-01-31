var categoryByBrandModel = require('../categoryByBrand/categoryByBrandModel');
var messages = require('../../../configuration/MESSAGE');

exports.categoryByBrandList = function(call, callback) {
    if (call.brandId != null) {
        categoryByBrandModel.getCategoryByBrand(call, function(err, result) {
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