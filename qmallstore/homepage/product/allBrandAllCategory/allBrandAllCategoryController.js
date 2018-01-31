var allBrandAllCategoryModel = require('../allBrandAllCategory/allBrandAllCategoryModel');
var messages = require('../../../../configuration/MESSAGE');

exports.allBrandAllCategoryList = function(call, callback) {
    allBrandAllCategoryModel.getAllBrandAllCategory(call, function(err, result) {
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