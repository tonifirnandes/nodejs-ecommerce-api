var brandListModel = require('../brand/brandListModel');
var messages = require('../../../configuration/MESSAGE');

exports.brandList = function(call, callback) {
    brandListModel.getBrandList(call, function(err, result) {
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