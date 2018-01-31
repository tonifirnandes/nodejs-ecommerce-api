app = require('../../../../indexApps');
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
                    console.log(rowsSession);
                } else {
                    callback(null, { code: 9001, messages: "Silahkan Login atau hubungi admin untuk melanjutkan transaksi" });
                }
            } else {
                callback(null, { code: 9001, messages: "Silahkan Login atau hubungi admin untuk melanjutkan transaksi" });
            }
        }
    });
};
exports.insertCartCustomer = function(query, callback) {
    db.query('SELECT * FROM cart WHERE customerEmail = "' + query.customerEmail + '" AND cartStatus = "active"', function(err, rowsCheckCart, fields) {
        if (err)
            callback(err, null);
        else {
            if (rowsCheckCart.length > 0) {
                var now = new Date();
                if (now > rowsCheckCart[0].cartExpireTime) {
                    var cartStatus = "expired";
                    var updateStatusCart = {
                        cartStatus: cartStatus
                    };
                    db.query('UPDATE cart set ? WHERE cartId = "' + rowsCheckCart[0].cartId + '"', updateStatusCart, function(err, rowsUpdateCartItem, fields) {
                        if (err) callback(err, null);
                        else {
                            var cartTime = new Date();
                            var cartExpireTime = date.addMonths(cartTime, 1);
                            var cartStatus = "active";
                            var postInsertCart = {
                                customerEmail: query.customerEmail,
                                cartTime: cartTime,
                                cartExpireTime: cartExpireTime,
                                cartStatus: cartStatus
                            };
                            db.query('INSERT INTO cart set ? ', postInsertCart, function(err, rowsInsertCart, fields) {
                                if (err) callback(err, null);
                                else {
                                    db.query('SELECT * FROM cart WHERE customerEmail = "' + query.customerEmail + '" AND cartStatus = "active"', function(err, rowsCheckCart, fields) {
                                        if (err)
                                            callback(err, null);
                                        else {
                                            var postInsertCartItem = {
                                                cartId: rowsCheckCart[0].cartId,
                                                productId: query.productId,
                                                cartItemProductPrice: query.productPrice,
                                                cartItemProductPriceType: query.cartItemProductPriceType,
                                                cartItemProductPriceStatus: query.cartItemProductPriceStatus,
                                                cartItemProductWeight: query.cartItemProductWeight,
                                                cartItemQuantity: query.cartItemQuantity,
                                                cartItemTotalProductWeight: query.cartItemProductWeight * query.cartItemQuantity,
                                                cartItemTotalPrice: query.cartItemQuantity * query.productPrice
                                            };
                                            db.query('INSERT INTO cart_item set ? ', postInsertCartItem, function(err, rowsInsertCartItem, fields) {
                                                if (err) callback(err, null);
                                                else {
                                                    var querySelectCartItem = "SELECT * FROM cart_item " +
                                                        "INNER JOIN cart ON cart_item.cartId = cart.cartId " +
                                                        "INNER JOIN product ON cart_item.productId = product.productId " +
                                                        "INNER JOIN customer_account ON cart.customerEmail = customer_account.customerEmail " +
                                                        "INNER JOIN customer_address ON customer_address.customerEmail = customer_account.customerEmail " +
                                                        "INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId " +
                                                        "INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId " +
                                                        "INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId " +
                                                        "INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId " +
                                                        "INNER JOIN product_price ON product_price.productId = product.productId " +
                                                        "WHERE cart_item.cartId = " + rowsCheckCart[0].cartId + ' AND product_price.productPriceStatus = "ACTIVE"';
                                                    db.query(querySelectCartItem, function(err, rowsSelectCartItem, fields) {
                                                        if (err)
                                                            callback(err, null);
                                                        else {
                                                            callback(null, rowsSelectCartItem);
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    });
                                }
                            });
                        }
                    });
                } else {
                    db.query('SELECT * FROM cart_item WHERE cartId = "' + rowsCheckCart[0].cartId + '" AND productId = ' + query.productId, function(err, rowsCheckCartItem, fields) {
                        if (err)
                            callback(err, null);
                        else {
                            if (rowsCheckCartItem.length > 0) {
                                var postUpdateCartItem = {
                                    cartItemProductPrice: query.productPrice,
                                    cartItemProductPriceType: query.cartItemProductPriceType,
                                    cartItemProductPriceStatus: query.cartItemProductPriceStatus,
                                    cartItemProductWeight: query.cartItemProductWeight,
                                    cartItemQuantity: query.cartItemQuantity,
                                    cartItemTotalProductWeight: query.cartItemProductWeight * query.cartItemQuantity,
                                    cartItemTotalPrice: query.cartItemQuantity * query.productPrice
                                };
                                db.query('UPDATE cart_item set ? WHERE cartId = "' + rowsCheckCart[0].cartId + '" AND productId = ' + query.productId, postUpdateCartItem, function(err, rowsUpdateCartItem, fields) {
                                    if (err) callback(err, null);
                                    else {
                                        var querySelectCartItem = "SELECT * FROM cart_item " +
                                            "INNER JOIN cart ON cart_item.cartId = cart.cartId " +
                                            "INNER JOIN product ON cart_item.productId = product.productId " +
                                            "INNER JOIN customer_account ON cart.customerEmail = customer_account.customerEmail " +
                                            "INNER JOIN customer_address ON customer_address.customerEmail = customer_account.customerEmail " +
                                            "INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId " +
                                            "INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId " +
                                            "INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId " +
                                            "INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId " +
                                            "INNER JOIN product_price ON product_price.productId = product.productId " +
                                            "WHERE cart_item.cartId = " + rowsCheckCart[0].cartId + ' AND product_price.productPriceStatus = "ACTIVE"';
                                        db.query(querySelectCartItem, function(err, rowsSelectCartItem, fields) {
                                            if (err)
                                                callback(err, null);
                                            else {
                                                callback(null, rowsSelectCartItem);
                                            }
                                        });
                                    }
                                });
                            } else {
                                var postInsertCartItem = {
                                    cartId: rowsCheckCart[0].cartId,
                                    productId: query.productId,
                                    cartItemProductPrice: query.productPrice,
                                    cartItemProductPriceType: query.cartItemProductPriceType,
                                    cartItemProductPriceStatus: query.cartItemProductPriceStatus,
                                    cartItemProductWeight: query.cartItemProductWeight,
                                    cartItemQuantity: query.cartItemQuantity,
                                    cartItemTotalProductWeight: query.cartItemProductWeight * query.cartItemQuantity,
                                    cartItemTotalPrice: query.cartItemQuantity * query.productPrice
                                };
                                db.query('INSERT INTO cart_item set ? ', postInsertCartItem, function(err, rowsInsertCartItem, fields) {
                                    if (err) callback(err, null);
                                    else {
                                        var querySelectCartItem = "SELECT * FROM cart_item " +
                                            "INNER JOIN cart ON cart_item.cartId = cart.cartId " +
                                            "INNER JOIN product ON cart_item.productId = product.productId " +
                                            "INNER JOIN customer_account ON cart.customerEmail = customer_account.customerEmail " +
                                            "INNER JOIN customer_address ON customer_address.customerEmail = customer_account.customerEmail " +
                                            "INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId " +
                                            "INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId " +
                                            "INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId " +
                                            "INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId " +
                                            "INNER JOIN product_price ON product_price.productId = product.productId " +
                                            "WHERE cart_item.cartId = " + rowsCheckCart[0].cartId + ' AND product_price.productPriceStatus = "ACTIVE"';
                                        db.query(querySelectCartItem, function(err, rowsSelectCartItem, fields) {
                                            if (err)
                                                callback(err, null);
                                            else {
                                                callback(null, rowsSelectCartItem);
                                            }
                                        });
                                    }
                                });
                            }
                        }
                    });
                }
            } else {
                var cartTime = new Date();
                var cartExpireTime = date.addMonths(cartTime, 1);
                var cartStatus = "active";
                var postInsertCart = {
                    customerEmail: query.customerEmail,
                    cartTime: cartTime,
                    cartExpireTime: cartExpireTime,
                    cartStatus: cartStatus
                };
                db.query('INSERT INTO cart set ? ', postInsertCart, function(err, rowsInsertCart, fields) {
                    if (err) callback(err, null);
                    else {
                        db.query('SELECT * FROM cart WHERE customerEmail = "' + query.customerEmail + '" AND cartStatus = "active"', function(err, rowsCheckCart, fields) {
                            if (err)
                                callback(err, null);
                            else {
                                var postInsertCartItem = {
                                    cartId: rowsCheckCart[0].cartId,
                                    productId: query.productId,
                                    cartItemProductPrice: query.productPrice,
                                    cartItemProductPriceType: query.cartItemProductPriceType,
                                    cartItemProductPriceStatus: query.cartItemProductPriceStatus,
                                    cartItemProductWeight: query.cartItemProductWeight,
                                    cartItemQuantity: query.cartItemQuantity,
                                    cartItemTotalProductWeight: query.cartItemProductWeight * query.cartItemQuantity,
                                    cartItemTotalPrice: query.cartItemQuantity * query.productPrice
                                };
                                db.query('INSERT INTO cart_item set ? ', postInsertCartItem, function(err, rowsInsertCartItem, fields) {
                                    if (err) callback(err, null);
                                    else {
                                        var querySelectCartItem = "SELECT * FROM cart_item " +
                                            "INNER JOIN cart ON cart_item.cartId = cart.cartId " +
                                            "INNER JOIN product ON cart_item.productId = product.productId " +
                                            "INNER JOIN customer_account ON cart.customerEmail = customer_account.customerEmail " +
                                            "INNER JOIN customer_address ON customer_address.customerEmail = customer_account.customerEmail " +
                                            "INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId " +
                                            "INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId " +
                                            "INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId " +
                                            "INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId " +
                                            "INNER JOIN product_price ON product_price.productId = product.productId " +
                                            "WHERE cart_item.cartId = " + rowsCheckCart[0].cartId + ' AND product_price.productPriceStatus = "ACTIVE"';
                                        db.query(querySelectCartItem, function(err, rowsSelectCartItem, fields) {
                                            if (err)
                                                callback(err, null);
                                            else {
                                                callback(null, rowsSelectCartItem);
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            }
        }
    });
};