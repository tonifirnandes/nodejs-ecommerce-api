var byCategoryModel = require('../byCategory/byCategoryModel');
var messages = require('../../../../configuration/MESSAGE');

exports.productByCategoryList = function(call, callback) {
    if (call.productCategoryId != null) {
        byCategoryModel.getProductByCategory(call, function(err, result) {
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