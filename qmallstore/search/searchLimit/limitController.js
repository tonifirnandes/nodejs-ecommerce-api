var searchLimitModel = require('../searchLimit/limitModel');
var messages = require('../../../configuration/MESSAGE');

exports.searchProductByBrandLimitList = function(call, callback) {
    if (call.productbrandid != null || call.searchingkey != null) {
        if (call.productbrandid === "0") {
            searchLimitModel.searchAllProductLimit(call, function(err, result) {
                if (err) {
                    callback(err, null);
                } else {
                    if (result[0]) {
                        callback(null, { code: 6000, messages: "product tersedia", data: result });
                    } else {
                        callback(null, messages.product_not_found);
                    }
                }
            });
        } else {
            searchLimitModel.searchByBrandLimit(call, function(err, result) {
                if (err) {
                    callback(err, null);
                } else {
                    if (result[0]) {
                        callback(null, { code: 6000, messages: "product tersedia", data: result });
                    } else {
                        callback(null, messages.product_not_found);
                    }
                }
            });
        }


    } else {
        callback(null, messages.parameter_not_completed);
    }
}