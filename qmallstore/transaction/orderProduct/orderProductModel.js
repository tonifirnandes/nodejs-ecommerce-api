app = require('../../../indexApps');
var moment = require('moment');
var groupArray = require('group-array');
var math = require('mathjs');
var date = require('date-and-time');
db = app.db;

exports.checkingSessionToken = function(query, callback) {
    db.query('SELECT * FROM customer_session WHERE customerEmail = "' + query.email + '" OR customerPhoneNumber = "' + query.email + '"', function(err, rowsSession, fields) {
        if (err)
            callback(err, null);
        else {
            if (rowsSession.length > 0) {
                if (query.sessiontoken === rowsSession[0].customerToken) {
                    callback(null, { code: 9000, messages: "masih login", rowsSession });
                } else {
                    callback(null, { code: 9001, messages: "Silahkan Login atau hubungi admin untuk melanjutkan transaksi" });
                }
            } else {
                callback(null, { code: 9001, messages: "Silahkan Login atau hubungi admin untuk melanjutkan transaksi" });
            }
        }
    });
};

exports.checkingPrice = function(query, callback) {
    var queryCartItemProductPriceList = "SELECT cart_item.productId, cart_item.cartItemProductPrice, " +
        "cart_item.cartItemProductPriceType, cart_item.cartItemProductPriceStatus " +
        "FROM cart " +
        "INNER JOIN cart_item ON cart_item.cartId = cart.cartId WHERE cart.cartId = " + query.cartId;
    console.log(queryCartItemProductPriceList);
    db.query(queryCartItemProductPriceList, function(err, cartItemProductPriceList, fields) {
        if (err) callback(err, null);
        else {
            validateCartItemPrice(cartItemProductPriceList, function(validatedCartItemPrice) {
                if (validatedCartItemPrice) {
                    if (validatedCartItemPrice.areAllPricesValid) {
                        callback(null, { code: 7070, messages: "all cart item prices are valid", data: validatedCartItemPrice });
                    } else {
                        callback(null, { code: 7071, messages: "some of cart item prices are not valid", data: validatedCartItemPrice });
                    }
                } else {
                    callback(null, { code: 7072, messages: "something goes wrong when validate cart item price", data: null });
                }
            });
        }
    });
};

function validateCartItemPrice(cartItemProductPriceList, callback) {
    var numOfValidatedPrice = 0,
        validatePriceError = false;
    cartItemProductPriceList.areAllPricesValid = true;
    cartItemProductPriceList.forEach(function(cartItemProductPrice) {
        var queryCheckAllPriceByProductId = "SELECT product_price.productPrice, product_price.productPriceType " +
            "FROM product " +
            "INNER JOIN product_price ON product_price.productId = product.productId " +
            "WHERE product.productId = " + cartItemProductPrice.productId +
            " AND product_price.productPriceType = " + "'" + cartItemProductPrice.cartItemProductPriceType + "'";
        db.query(queryCheckAllPriceByProductId, function(err, checkedPrice, fields) {
            numOfValidatedPrice++;
            if (err) {
                validatePriceError = true;
            } else {
                if (cartItemProductPrice.cartItemProductPrice === checkedPrice[0].productPrice) {
                    cartItemProductPrice.isPriceValid = true;
                } else {
                    cartItemProductPriceList.areAllPricesValid = false;
                    cartItemProductPrice.isPriceValid = false;
                    cartItemProductPrice.validPriceValue = checkedPrice[0].productPrice;
                }
            }
            //Todo : improve async callback using promise
            if (numOfValidatedPrice === cartItemProductPriceList.length) {
                if (callback) {
                    if (!validatePriceError) {
                        callback(cartItemProductPriceList);
                    } else {
                        callback(null);
                    }
                }
            }
        });
    });
}

exports.checkingProductWeight = function(query, callback) {
    var queryCartItemProductWeightList = "SELECT * " +
        "FROM cart " +
        "INNER JOIN cart_item ON cart_item.cartId = cart.cartId WHERE cart.cartId = " + query.cartId;
    console.log(queryCartItemProductWeightList);
    db.query(queryCartItemProductWeightList, function(err, cartItemProductWeightList, fields) {
        if (err) callback(err, null);
        else {
            validateCartItemProductWeight(cartItemProductWeightList, function(validatedCartItemProductWeight) {
                if (validatedCartItemProductWeight) {
                    if (validatedCartItemProductWeight.areAllProductWeightValid) {
                        callback(null, { code: 7050, messages: "all cart item product weight are valid", data: validatedCartItemProductWeight });
                    } else {
                        callback(null, { code: 7051, messages: "some of cart item product weight are not valid", data: validatedCartItemProductWeight });
                    }
                } else {
                    callback(null, { code: 7052, messages: "something goes wrong when validate cart item product weight", data: null });
                }
            });
        }
    });
};

function validateCartItemProductWeight(cartItemProductWeightList, callback) {
    var numOfValidatedProductWeight = 0,
        validateProductWeigthError = false;
    cartItemProductWeightList.areAllProductWeightValid = true;
    cartItemProductWeightList.forEach(function(cartItemProductWeight) {
        var queryCheckAllProductWeightByProductId = "SELECT * " +
            "FROM product " +
            "INNER JOIN product_price ON product_price.productId = product.productId " +
            "WHERE product.productId = " + cartItemProductWeight.productId +
            " AND product_price.productPriceType = " + "'" + cartItemProductWeight.cartItemProductPriceType + "'";
        console.log(queryCheckAllProductWeightByProductId);
        db.query(queryCheckAllProductWeightByProductId, function(err, checkedProductWeight, fields) {
            numOfValidatedProductWeight++;
            if (err) {
                validateProductWeigthError = true;
            } else {
                if (cartItemProductWeight.cartItemProductWeight === checkedProductWeight[0].productWeight) {
                    cartItemProductWeight.isProductWeightValid = true;
                } else {
                    cartItemProductWeightList.areAllProductWeightValid = false;
                    cartItemProductWeight.isProductWeightValid = false;
                    cartItemProductWeight.validProductWeightValue = checkedProductWeight[0].productWeight;
                }
            }
            //Todo : improve async callback using promise
            if (numOfValidatedProductWeight === cartItemProductWeightList.length) {
                if (callback) {
                    if (!validateProductWeigthError) {
                        callback(cartItemProductWeightList);
                    } else {
                        callback(null);
                    }
                }
            }
        });
    });
}

exports.checkingProductStock = function(query, callback) {
    var queryCartItemProductStockList = "SELECT * " +
        "FROM cart " +
        "INNER JOIN cart_item ON cart_item.cartId = cart.cartId WHERE cart.cartId = " + query.cartId;
    console.log(queryCartItemProductStockList);
    db.query(queryCartItemProductStockList, function(err, cartItemProductStockList, fields) {
        if (err) callback(err, null);
        else {
            validateCartItemProductStock(cartItemProductStockList, function(validatedCartItemProductStock) {
                if (validatedCartItemProductStock) {
                    if (validatedCartItemProductStock.areAllProductStockValid) {
                        callback(null, { code: 7060, messages: "all cart item product Stock are valid", data: validatedCartItemProductStock });
                    } else {
                        callback(null, { code: 7061, messages: "some of cart item product Stock are not valid", data: validatedCartItemProductStock });
                    }
                } else {
                    callback(null, { code: 7062, messages: "something goes wrong when validate cart item product Stock", data: null });
                }
            });
        }
    });
};

function validateCartItemProductStock(cartItemProductStockList, callback) {
    var numOfValidatedProductStock = 0,
        validateProductStockError = false;
    cartItemProductStockList.areAllProductStockValid = true;
    cartItemProductStockList.forEach(function(cartItemProductStock) {
        var queryCheckAllProductStockByProductId = "SELECT * " +
            "FROM product " +
            "INNER JOIN product_price ON product_price.productId = product.productId " +
            "WHERE product.productId = " + cartItemProductStock.productId +
            " AND product_price.productPriceType = " + "'" + cartItemProductStock.cartItemProductPriceType + "'";
        console.log(queryCheckAllProductStockByProductId);
        db.query(queryCheckAllProductStockByProductId, function(err, checkedProductStock, fields) {
            numOfValidatedProductStock++;
            if (err) {
                validateProductStockError = true;
            } else {

                var cartItemProductStockCheck = checkedProductStock[0].productStock - cartItemProductStock.cartItemQuantity;
                if (cartItemProductStockCheck >= 0) {
                    cartItemProductStock.isProductStockValid = true;
                } else {
                    cartItemProductStockList.areAllProductStockValid = false;
                    cartItemProductStock.isProductStockValid = false;
                    cartItemProductStock.ProductStockMissValue = cartItemProductStockCheck;
                }
            }
            //Todo : improve async callback using promise
            if (numOfValidatedProductStock === cartItemProductStockList.length) {
                if (callback) {
                    if (!validateProductStockError) {
                        callback(cartItemProductStockList);
                    } else {
                        callback(null);
                    }
                }
            }
        });
    });
}

exports.productStockUpdate = function(query, callback) {
    var queryCartItemProductStockUpdateList = "SELECT * " +
        "FROM cart " +
        "INNER JOIN cart_item ON cart_item.cartId = cart.cartId WHERE cart.cartId = " + query.cartId;
    db.query(queryCartItemProductStockUpdateList, function(err, cartItemProductStockUpdateList, fields) {
        if (err) callback(err, null);
        else {
            validateCartItemProductStockUpdate(cartItemProductStockUpdateList, function(validatedCartItemProductStockUpdate) {
                if (validatedCartItemProductStockUpdate) {
                    if (validatedCartItemProductStockUpdate.areAllProductStockUpdateValid) {
                        callback(null, { code: 7080, messages: "all cart item product StockUpdate are valid", data: validatedCartItemProductStockUpdate });
                    } else {
                        callback(null, { code: 7081, messages: "some of cart item product StockUpdate are not valid", data: validatedCartItemProductStockUpdate });
                    }
                } else {
                    callback(null, { code: 7082, messages: "something goes wrong when validate cart item product StockUpdate", data: null });
                }
            });
        }
    });
};

function validateCartItemProductStockUpdate(cartItemProductStockUpdateList, callback) {
    var numOfValidatedProductStockUpdate = 0,
        validateProductStockUpdateError = false;
    cartItemProductStockUpdateList.areAllProductStockUpdateValid = true;
    cartItemProductStockUpdateList.forEach(function(cartItemProductStockUpdate) {
        var queryCheckAllProductStockUpdateByProductId = "SELECT * " +
            "FROM product " +
            "INNER JOIN product_price ON product_price.productId = product.productId " +
            "WHERE product.productId = " + cartItemProductStockUpdate.productId +
            " AND product_price.productPriceType = " + "'" + cartItemProductStockUpdate.cartItemProductPriceType + "'";
        db.query(queryCheckAllProductStockUpdateByProductId, function(err, checkedProductStockUpdate, fields) {
            if (err) {
                validateProductStockUpdateError = true;
            } else {
                var cartItemProductStockUpdateCheck = checkedProductStockUpdate[0].productStock - cartItemProductStockUpdate.cartItemQuantity;
                var postUpdateProductStock = {
                    productStock: cartItemProductStockUpdateCheck
                };
                var queryUpdateProductStock = "UPDATE product set ? WHERE productId = " + cartItemProductStockUpdate.productId;
                db.query(queryUpdateProductStock, postUpdateProductStock, function(err, rowsUpdateProductStock, fields) {
                    if (err) {
                        validateProductStockUpdateError = true;
                    } else {
                        numOfValidatedProductStockUpdate++;
                        // Todo: improve async callback using promise
                        if (numOfValidatedProductStockUpdate === cartItemProductStockUpdateList.length) {
                            if (callback) {
                                if (!validateProductStockUpdateError) {
                                    callback(cartItemProductStockUpdateList);
                                } else {
                                    callback(null);
                                }
                            }
                        }
                        console.log(rowsUpdateProductStock);
                    }
                });
            }
        });
    });
}


exports.addToOrder = function(query, callback) {
    var queryAddToOrder = "SELECT Sum(cart_item.cartItemTotalProductWeight) AS orderProductWeightFull, " +
        "Sum(cart_item.cartItemTotalPrice) AS orderProductPriceFull " +
        "FROM cart " +
        "INNER JOIN cart_item ON cart_item.cartId = cart.cartId WHERE cart.cartId = " + query.cartId;
    console.log(queryAddToOrder);
    db.query(queryAddToOrder, function(err, orderList, fields) {
        if (err) {
            callback(err, null);
            console.log("error");
        } else {
            var queryCheckCartId = "SELECT * " +
                "FROM `order` " +
                "INNER JOIN order_status ON `order`.orderStatusId = order_status.orderStatusId WHERE `order`.cartId = " + query.cartId;
            console.log(queryCheckCartId);
            db.query(queryCheckCartId, function(err, CheckCartIdInOrder, fields) {
                if (err) {
                    callback(err, null);
                    console.log("error");
                } else {
                    if (CheckCartIdInOrder.length > 0) {
                        callback(null, { code: 7091, messages: "cart already exist" });
                    } else {
                        var orderTime = new Date();
                        var orderExpiredTime = date.addHours(orderTime, 3);
                        var orderStatus = 2;
                        var postInsertOrder = {
                            cartId: query.cartId,
                            orderTime: orderTime,
                            orderExpiredTime: orderExpiredTime,
                            orderProductWeightFull: orderList[0].orderProductWeightFull,
                            orderProductPriceFull: orderList[0].orderProductPriceFull,
                            orderStatusId: orderStatus
                        };
                        db.query('INSERT INTO `order` set ? ', postInsertOrder, function(err, rowsInsertOrder, fields) {
                            if (err) {
                                callback(err, null);
                                console.log("error insert");
                            } else {
                                var queryOrderShow = "SELECT * " +
                                    "FROM `order` " +
                                    "INNER JOIN order_status ON `order`.orderStatusId = order_status.orderStatusId WHERE `order`.cartId = " + query.cartId;
                                console.log(queryOrderShow);
                                db.query(queryOrderShow, function(err, resultOrderShow, fields) {
                                    if (err) {
                                        callback(err, null);
                                        console.log("error");
                                    } else {
                                        callback(null, { code: 7090, messages: "all cart item product add to order", data: resultOrderShow });
                                    }
                                });

                            }
                        });
                    }
                }
            });
        }
    });
};