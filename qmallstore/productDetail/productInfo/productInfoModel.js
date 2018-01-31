app = require('../../../indexApps');
var moment = require('moment');
var groupArray = require('group-array');
var math = require('mathjs');
db = app.db;

exports.checkingSessionToken = function(query, callback) {
    db.query('SELECT * FROM customer_session WHERE customerEmail = "' + query.email + '"', function(err, rowss, fields) {
        if (err)
            callback(err, null);
        else {
            if (rowss.length > 0) {
                if (query.sessiontoken === rowss[0].customerToken) {
                    callback(null, { code: 9000, messages: "masih login", rowss });
                    console.log(rowss);
                } else {
                    callback(null, { messages: "sudah tidak login" });
                    console.log(rowss);
                }
            } else {
                callback(null, { messages: "sudah tidak login" });
                console.log(rowss);
            }

        }
    });
};
exports.productInfoLoginList = function(query, callback) {
    var queryProductInfoLoginList = 'SELECT ' +
        'product_' + query.productBrandId + '.productId, ' +
        'product_brand.productBrandId, ' +
        'product_category.productCategoryId, ' +
        'product_price_' + query.productBrandId + '.productPriceId, ' +
        'product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeTypeId, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeId, ' +
        'product_' + query.productBrandId + '.productDescription, ' +
        'product_' + query.productBrandId + '.productWeight, ' +
        'product_' + query.productBrandId + '.productDownloadLink, ' +
        'product_brand.productBrandDescription, ' +
        'product_brand.productBrandImage, ' +
        'product_' + query.productBrandId + '.productName, ' +
        'product_' + query.productBrandId + '.productPartNumber, ' +
        'product_' + query.productBrandId + '.productStock, ' +
        'product_' + query.productBrandId + '.productSpesification, ' +
        'product_category.productCategoryDescription, ' +
        'product_category.productCategoryImage, ' +
        'product_delivery_time_type_' + query.productBrandId + '.productDeliveryTImeType, ' +
        'product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeValue, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeMin, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeMax, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeMax + product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeValue AS sortingDeliveryTime, ' +
        'GROUP_CONCAT(product_price_' + query.productBrandId + '.productPriceType, ":", product_price_' + query.productBrandId + '.productPrice, ":", product_price_' + query.productBrandId + '.productPriceStatus) AS priceList, ' +
        'product_' + query.productBrandId + '.productImagesPath ' +
        'FROM ' +
        'product_' + query.productBrandId +
        ' INNER JOIN product_brand ON product_' + query.productBrandId + '.productBrandId = product_brand.productBrandId ' +
        'INNER JOIN product_category ON product_' + query.productBrandId + '.productCategoryId = product_category.productCategoryId ' +
        'INNER JOIN product_delivery_time_' + query.productBrandId + ' ON product_delivery_time_' + query.productBrandId + '.productId = product_' + query.productBrandId + '.productId AND product_' + query.productBrandId + '.productDeliveryTimeId = product_delivery_time_' + query.productBrandId + '.productDeliveryTimeId ' +
        'INNER JOIN product_delivery_time_type_' + query.productBrandId + ' ON product_delivery_time_' + query.productBrandId + '.productDeliveryTimeTypeId = product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeTypeId ' +
        'INNER JOIN product_price_' + query.productBrandId + ' ON product_price_' + query.productBrandId + '.productId = product_' + query.productBrandId + '.productId ' +
        'WHERE ' +
        'product_' + query.productBrandId + '.productId =' + query.productId + ' AND ' +
        'product_price_' + query.productBrandId + '.productPriceDisplayStatus = "SHOW" ' +
        'GROUP BY ' +
        'product_' + query.productBrandId + '.productId ';
    console.log(queryProductInfoLoginList);
    db.query(queryProductInfoLoginList, function(err, rowsProductInfoLoginList, fields) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            var queryCheckProductId = 'SELECT * FROM product_top_' + query.productBrandId +
                ' WHERE productId = ' + rowsProductInfoLoginList[0].productId;
            console.log(queryCheckProductId);
            db.query(queryCheckProductId, function(err, rowsCheckProductId, fields) {
                if (err) {
                    callback(err, null);
                    console.log(err);
                } else {
                    if (rowsCheckProductId.length > 0) {
                        var topViewing = 1 + rowsCheckProductId[0].viewingNumber;
                        var postTopViewing = {
                            viewingNumber: topViewing
                        };
                        db.query('UPDATE product_top_' + query.productBrandId + ' SET ? WHERE productId = ' + rowsProductInfoLoginList[0].productId, postTopViewing, function(err, rowsUpdateViewingNumber, fields) {
                            if (err) {
                                callback(err, null);
                                console.log(err);
                            } else {
                                var lengthRowsPagination = rowsProductInfoLoginList.length;
                                for (var i = 0; i < lengthRowsPagination; i++) {
                                    var priceListString = rowsProductInfoLoginList[i].priceList;
                                    rowsProductInfoLoginList[i].priceList = priceListString.split(',');
                                    var priceSplit = rowsProductInfoLoginList[i].priceList;
                                    for (var c = 0; c < priceSplit.length; c++) {
                                        var priceListSplitString = rowsProductInfoLoginList[i].priceList[c];
                                        var priceListItem = {
                                            priceType: "",
                                            priceValue: 0,
                                            priceStatus: ""
                                        };
                                        rowsProductInfoLoginList[i].priceList[c] = priceListSplitString.split(':');
                                        priceListItem.priceType = rowsProductInfoLoginList[i].priceList[c][0];
                                        priceListItem.priceValue = rowsProductInfoLoginList[i].priceList[c][1];
                                        priceListItem.priceStatus = rowsProductInfoLoginList[i].priceList[c][2];
                                        rowsProductInfoLoginList[i].priceList[c] = priceListItem;
                                    }
                                }
                                callback(null, { code: 2010, message: "data dapat diakses", data: rowsProductInfoLoginList });
                                console.log(rowsUpdateViewingNumber);
                            }
                        });
                    } else {
                        var topViewing = 1;
                        var topSelling = 0;
                        var postTopViewing = {
                            productId: rowsProductInfoLoginList[0].productId,
                            viewingNumber: topViewing,
                            sellingNumber: topSelling
                        };
                        db.query('INSERT INTO product_top_' + query.productBrandId + ' SET ? ', postTopViewing, function(err, rowsAddtopViewing, fields) {
                            if (err) {
                                callback(err, null);
                                console.log(err);
                            } else {
                                var lengthRowsPagination = rowsProductInfoLoginList.length;
                                for (var i = 0; i < lengthRowsPagination; i++) {
                                    var priceListString = rowsProductInfoLoginList[i].priceList;
                                    rowsProductInfoLoginList[i].priceList = priceListString.split(',');
                                    var priceSplit = rowsProductInfoLoginList[i].priceList;
                                    for (var c = 0; c < priceSplit.length; c++) {
                                        var priceListSplitString = rowsProductInfoLoginList[i].priceList[c];
                                        var priceListItem = {
                                            priceType: "",
                                            priceValue: 0,
                                            priceStatus: ""
                                        };
                                        rowsProductInfoLoginList[i].priceList[c] = priceListSplitString.split(':');
                                        priceListItem.priceType = rowsProductInfoLoginList[i].priceList[c][0];
                                        priceListItem.priceValue = rowsProductInfoLoginList[i].priceList[c][1];
                                        priceListItem.priceStatus = rowsProductInfoLoginList[i].priceList[c][2];
                                        rowsProductInfoLoginList[i].priceList[c] = priceListItem;
                                    }
                                }
                                callback(null, { code: 2010, message: "data dapat diakses", data: rowsProductInfoLoginList });
                                console.log(rowsAddtopViewing);
                            }
                        });
                    }
                }
            });
        }
    });
};
exports.productInfoNoLoginList = function(query, callback) {
    var queryproductInfoNoLoginList = 'SELECT ' +
        'product_' + query.productBrandId + '.productId, ' +
        'product_brand.productBrandId, ' +
        'product_category.productCategoryId, ' +
        'product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeTypeId, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeId, ' +
        'product_' + query.productBrandId + '.productDescription, ' +
        'product_' + query.productBrandId + '.productWeight, ' +
        'product_' + query.productBrandId + '.productDownloadLink, ' +
        'product_brand.productBrandDescription, ' +
        'product_brand.productBrandImage, ' +
        'product_' + query.productBrandId + '.productName, ' +
        'product_' + query.productBrandId + '.productPartNumber, ' +
        'product_' + query.productBrandId + '.productStock, ' +
        'product_' + query.productBrandId + '.productSpesification, ' +
        'product_category.productCategoryDescription, ' +
        'product_category.productCategoryImage, ' +
        'product_delivery_time_type_' + query.productBrandId + '.productDeliveryTImeType, ' +
        'product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeValue, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeMin, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeMax, ' +
        'product_delivery_time_' + query.productBrandId + '.productDeliveryTimeMax + product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeValue AS sortingDeliveryTime, ' +
        'product_' + query.productBrandId + '.productImagesPath ' +
        'FROM ' +
        'product_' + query.productBrandId +
        ' INNER JOIN product_brand ON product_' + query.productBrandId + '.productBrandId = product_brand.productBrandId ' +
        'INNER JOIN product_category ON product_' + query.productBrandId + '.productCategoryId = product_category.productCategoryId ' +
        'INNER JOIN product_delivery_time_' + query.productBrandId + ' ON product_delivery_time_' + query.productBrandId + '.productId = product_' + query.productBrandId + '.productId AND product_' + query.productBrandId + '.productDeliveryTimeId = product_delivery_time_' + query.productBrandId + '.productDeliveryTimeId ' +
        'INNER JOIN product_delivery_time_type_' + query.productBrandId + ' ON product_delivery_time_' + query.productBrandId + '.productDeliveryTimeTypeId = product_delivery_time_type_' + query.productBrandId + '.productDeliveryTimeTypeId ' +
        'WHERE ' +
        'product_' + query.productBrandId + '.productId =' + query.productId;
    console.log(queryproductInfoNoLoginList);
    db.query(queryproductInfoNoLoginList, function(err, rowsproductInfoNoLoginList, fields) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            var queryCheckProductIdNoLogin = 'SELECT * FROM product_top_' + query.productBrandId +
                ' WHERE productId = ' + rowsproductInfoNoLoginList[0].productId;
            console.log(queryCheckProductIdNoLogin);
            db.query(queryCheckProductIdNoLogin, function(err, rowsCheckProductIdNoLogin, fields) {
                if (err) {
                    callback(err, null);
                    console.log(err);
                } else {
                    if (rowsCheckProductIdNoLogin.length > 0) {
                        var topViewing = 1 + rowsCheckProductIdNoLogin[0].viewingNumber;
                        var postTopViewing = {
                            viewingNumber: topViewing
                        };
                        db.query('UPDATE product_top_' + query.productBrandId + ' SET ? WHERE productId = ' + rowsproductInfoNoLoginList[0].productId, postTopViewing, function(err, rowsUpdateViewingNumberNoLogin, fields) {
                            if (err) {
                                callback(err, null);
                                console.log(err);
                            } else {
                                callback(null, { code: 2010, message: "data dapat diakses", data: rowsproductInfoNoLoginList });
                                console.log(rowsUpdateViewingNumberNoLogin);
                            }
                        });
                    } else {
                        var topViewing = 1;
                        var topSelling = 0;
                        var postTopViewing = {
                            productId: rowsproductInfoNoLoginList[0].productId,
                            viewingNumber: topViewing,
                            sellingNumber: topSelling
                        };
                        db.query('INSERT INTO product_top_' + query.productBrandId + ' SET ? ', postTopViewing, function(err, rowsAddtopViewingNoLogin, fields) {
                            if (err) {
                                callback(err, null);
                                console.log(err);
                            } else {
                                callback(null, { code: 2010, message: "data dapat diakses", data: rowsproductInfoNoLoginList });
                                console.log(rowsAddtopViewingNoLogin);
                            }
                        });
                    }
                }
            });
        }
    });
};