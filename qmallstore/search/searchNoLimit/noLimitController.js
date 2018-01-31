var searchNoLimitModel = require('../searchNoLimit/noLimitModel');
var messages = require('../../../configuration/MESSAGE');

exports.searchProductByBrandNoLimitList = function(call, callback) {
    if (call.productbrandid != null || call.searchingkey != null) {
        if (call.productbrandid === "0") {
            searchNoLimitModel.searchAllProductNoLimit(call, function(err, result) {
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
            searchNoLimitModel.searchByBrandNoLimit(call, function(err, result) {
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