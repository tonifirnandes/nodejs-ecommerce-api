var searchByPartNumberModel = require('../searchByPartNumber/searchByPartNumberModel');
var messages = require('../../../configuration/MESSAGE');

exports.searchProductByPartNumberList = function(call, callback) {
    if (call.searchingkey != null) {
        searchByPartNumberModel.searchProductByPartNumber(call, function(err, result) {
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