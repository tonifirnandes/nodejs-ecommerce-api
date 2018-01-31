var searchProductModel = require('../searchProduct/searchProductModel');
var messages = require('../../../configuration/MESSAGE');

exports.checkingHeaderSession = function(call, callback) {
    searchProductModel.checkingSessionToken(call, function(err, resulted) {
        if (err) {
            callback(err, null);
        } else {
            if (resulted.code === 9000) {
                callback(null, resulted)
            } else {
                callback(null, resulted)
            }
        }
    });
}
exports.searchProductListLogin = function(call, callback) {
    if (call.searchingkey != null || call.stocks != null || call.productBrandId != null) {
        searchProductModel.searchProductNoLoginPromise(call)
            .then(function(data) {
                onPromiseSuccesslogin(callback, data);
            })
            .then(null, function(err) {
                onPromiseErrorLogin(callback, err);
            })
    } else {
        callback(null, messages.parameter_not_completed);
    }
}

exports.searchProductListNoLogin = function(call, callback) {
    if (call.searchingkey != null || call.stocks != null || call.productBrandId != null) {
        searchProductModel.searchProductNoLoginPromise(call)
            .then(function(data) {
                onPromiseSuccessNologin(callback, data);
            })
            .then(null, function(err) {
                onPromiseErrorNoLogin(callback, err);
            })
    } else {
        callback(null, messages.parameter_not_completed);
    }
}

var onPromiseSuccessNologin = function(callback, rows) {
    callback(null, { code: 6000, messages: "product tersedia", data: rows });
}

var onPromiseErrorNoLogin = function(callback, err) {
    console.log("error promise");
    callback(err, null);
}

var onPromiseSuccesslogin = function(callback, rows) {
    callback(null, { code: 6000, messages: "product tersedia", data: rows });
}

var onPromiseErrorLogin = function(callback, err) {
    console.log("error promise");
    callback(err, null);
}