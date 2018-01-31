var orderProductModel = require('../orderProduct/orderProductModel');
var messages = require('../../../configuration/MESSAGE');

exports.checkingHeaderSession = function(call, callback) {
    orderProductModel.checkingSessionToken(call, function(err, resultSession) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                callback(null, resultSession)
            } else {
                callback(null, resultSession)
            }
        }
    });
}
exports.checkingPriceController = function(call, callback) {
    if (call.cartId != null) {
        orderProductModel.checkingProductWeight(call, function(err, resultcheckingProductWeight) {
            if (err) {
                callback(err, null);
            } else {
                if (resultcheckingProductWeight.code === 7050) {
                    orderProductModel.checkingPrice(call, function(err, resultcheckingPrice) {
                        if (err) {
                            callback(err, null);
                        } else {
                            if (resultcheckingPrice.code === 7070) {
                                orderProductModel.checkingProductStock(call, function(err, resultcheckingProductStock) {
                                    if (err) {
                                        callback(err, null);
                                    } else {
                                        if (resultcheckingProductStock.code === 7060) {
                                            orderProductModel.productStockUpdate(call, function(err, resultproductStockUpdate) {
                                                if (err) {
                                                    callback(err, null);
                                                } else {
                                                    orderProductModel.addToOrder(call, function(err, resultaddToOrder) {
                                                        if (err) {
                                                            callback(err, null);
                                                        } else {
                                                            callback(null, resultaddToOrder);
                                                        }
                                                    });
                                                }
                                            });
                                        } else {
                                            callback(null, resultcheckingProductStock);
                                        }
                                    }
                                });
                            } else {
                                callback(null, resultcheckingPrice);
                            }
                        }
                    });
                } else {
                    callback(null, resultcheckingProductWeight);
                }
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}