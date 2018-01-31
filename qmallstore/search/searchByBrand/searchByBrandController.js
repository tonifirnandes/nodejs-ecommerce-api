var searchByBrandModel = require('../searchByBrand/searchByBrandModel');
var messages = require('../../../configuration/MESSAGE');

exports.searchProductListLogin = function(call, callback) {
    if (call.brandFilter != null || call.searchingkey != null || call.stocks != null || call.categoryFilter != null || call.sortingOption != null || call.deliveryTimeFilter != null) {
        if (call.brandFilter === "0") {
            searchByBrandModel.searchProductByPartNumber(call, function(err, result) {
                if (err) {
                    callback(err, null);
                } else {
                    if (result.code === 6000) {
                        callback(null, result);
                    } else {
                        callback(null, messages.product_not_found);
                    }
                }
            });
        } else {
            searchByBrandModel.searchProductLogin(call, function(err, result) {
                if (err) {
                    callback(err, null);
                } else {
                    if (result.code === 6000) {
                        callback(null, result);
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
exports.searchProductByBrandListNoLogin = function(call, callback) {
    if (call.brandFilter != null || call.searchingkey != null || call.stocks != null || call.categoryFilter != null || call.sortingOption != null || call.deliveryTimeFilter != null) {
        if (call.brandFilter === "0") {
            searchByBrandModel.searchProductByPartNumberNoLogin(call, function(err, result) {
                if (err) {
                    callback(err, null);
                } else {
                    if (result.code === 6000) {
                        callback(null, result);
                    } else {
                        callback(null, messages.product_not_found);
                    }
                }
            });
        } else {
            searchByBrandModel.searchProductNoLogin(call, function(err, result) {
                if (err) {
                    callback(err, null);
                } else {
                    if (result.code === 6000) {
                        callback(null, result);
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
exports.checkingHeaderSession = function(call, callback) {
    searchByBrandModel.checkingSessionToken(call, function(err, resulted) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            if (resulted.code === 9000) {
                callback(null, resulted)
            } else {
                callback(null, resulted)
            }
        }
    });
}