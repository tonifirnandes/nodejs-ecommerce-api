app = require('../../../indexApps');
var moment = require('moment');
var groupArray = require('group-array');
var math = require('mathjs');
db = app.db;

var QUERY_AND_STRING = " AND ";
var QUERY_OR_STRING = " OR ";
var QUERY_OPEN_CLOSURE_STRING = " ( ";
var QUERY_CLOSE_CLOSURE_STRING = " ) ";
var QUERY_FILTER_OPTIONS_DELIMITTER = ",";
var QUERY_EQUALS_STRING = " = ";
var PRODUCT_FILTER_BY_BRAND_COLUMN = "product.productBrandId";
var PRODUCT_FILTER_BY_STOCK_COLUMN = "product.productStock > ";
var PRODUCT_FILTER_BY_CATEGORY_COLUMN = "product.productCategoryId";
var PRODUCT_FILTER_BY_DELIVERY_TIME_COLUMN = "product_delivery_time_type.productDeliveryTimeTypeId";

var PRODUCT_ORDER_BY_PRICE = " ORDER BY product_price.productPrice ASC";
var PRODUCT_ORDER_BY_STOCK = " ORDER BY product.productStock DESC";
var PRODUCT_ORDER_BY_DELIVERY_TIME = " ORDER BY sortingDeliveryTime ASC";

exports.searchProductLogin = function(query, callback) {
    var sortingOptions = getSortingQuery(query);
    var filterOptions = getFilterByBrandQuery(query);
    var filterStock = getFilterByStockQuery(query);
    var filterCategory = getFilterByCategoryQuery(query);
    var filterDeliveryTime = getFilterByDeliveryTimeQuery(query);

    var finalQueryDataLength = 'SELECT  ' +
        'Count(product_delivery_time_type.productDeliveryTimeTypeId) AS dataLength ' +
        'FROM  product ' +
        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
        'INNER JOIN product_price ON product_price.productId = product.productId ' +
        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' GROUP BY product.productId';
    db.query(finalQueryDataLength, function(err, rowsDataLength, fields) {
        if (err) callback(err, null);
        else {
            var finalQueryFilterDeliveryTime = 'SELECT  ' +
                'product_delivery_time_type.productDeliveryTImeType,product_delivery_time_type.productDeliveryTimeTypeId ' +
                'FROM  product ' +
                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                'INNER JOIN product_price ON product_price.productId = product.productId ' +
                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' GROUP BY product_delivery_time_type.productDeliveryTImeType';
            db.query(finalQueryFilterDeliveryTime, function(err, rowsFilterDeliveryTime, fields) {
                if (err) callback(err, null);
                else {
                    var finalQueryFilterBrandProduct = 'SELECT  ' +
                        'product_brand.productBrandId, product_brand.productBrandDescription ' +
                        'FROM  product ' +
                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                        'INNER JOIN product_price ON product_price.productId = product.productId ' +
                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' GROUP BY product_brand.productBrandId';
                    console.log(finalQueryFilterBrandProduct);
                    db.query(finalQueryFilterBrandProduct, function(err, rowsFilterBrandProduct, fields) {
                        if (err) callback(err, null);
                        else {
                            var finalQueryFilterCategoryProduct = 'SELECT  ' +
                                'product_category.productCategoryId,product_category.productCategoryDescription ' +
                                'FROM  product ' +
                                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                'INNER JOIN product_price ON product_price.productId = product.productId ' +
                                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' GROUP BY product.productCategoryId';
                            db.query(finalQueryFilterCategoryProduct, function(err, rowsFilterCategoryProduct, fields) {
                                if (err) callback(err, null);
                                else {
                                    var dataLength = rowsDataLength.length;
                                    var filterDeliveryTimeType = rowsFilterDeliveryTime;
                                    var filterBrandProduct = rowsFilterBrandProduct;
                                    var filterCategoryProduct = rowsFilterCategoryProduct;
                                    var limit = (query.page - 1) * 10;
                                    var finalQueryPagination = 'SELECT  ' +
                                        'product.productId,product_brand.productBrandId,product_category.productCategoryId, ' +
                                        'product_price.productPriceId,product_delivery_time_type.productDeliveryTimeTypeId, ' +
                                        'product_delivery_time.productDeliveryTimeId,product.productDescription, ' +
                                        'product.productWeight,product.productDownloadLink,product_brand.productBrandDescription, ' +
                                        'product_brand.productBrandImage,product.productName,product.productPartNumber, ' +
                                        'product.productStock,product.productSpesification,product_category.productCategoryDescription, ' +
                                        'product_category.productCategoryImage,product_delivery_time_type.productDeliveryTImeType,  ' +
                                        'product_delivery_time_type.productDeliveryTimeValue,product_delivery_time.productDeliveryTimeMin, ' +
                                        'product_delivery_time.productDeliveryTimeMax, ' +
                                        'product_delivery_time.productDeliveryTimeMax + product_delivery_time_type.productDeliveryTimeValue AS sortingDeliveryTime, ' +
                                        'GROUP_CONCAT(product_price.productPriceType,' + '":"' + ',product_price.productPrice,' + '":"' + ',product_price.productPriceStatus) AS priceList ' +
                                        'FROM  product ' +
                                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                        'INNER JOIN product_price ON product_price.productId = product.productId ' +
                                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' AND product_price.productPriceDisplayStatus="SHOW" GROUP BY product.productId' + sortingOptions + ' LIMIT ' + limit + ',10';
                                    console.log(finalQueryPagination);
                                    db.query(finalQueryPagination, function(err, rowsPagination, fields) {
                                        if (err) callback(err, null);
                                        else {

                                            var lengthRowsPagination = rowsPagination.length;
                                            for (var i = 0; i < lengthRowsPagination; i++) {
                                                var priceListString = rowsPagination[i].priceList;
                                                rowsPagination[i].priceList = priceListString.split(',');
                                                var priceSplit = rowsPagination[i].priceList;
                                                for (var c = 0; c < priceSplit.length; c++) {
                                                    var priceListSplitString = rowsPagination[i].priceList[c];
                                                    var priceListItem = {
                                                        priceType: "",
                                                        priceValue: 0,
                                                        priceStatus: ""
                                                    };
                                                    rowsPagination[i].priceList[c] = priceListSplitString.split(':');
                                                    priceListItem.priceType = rowsPagination[i].priceList[c][0];
                                                    priceListItem.priceValue = rowsPagination[i].priceList[c][1];
                                                    priceListItem.priceStatus = rowsPagination[i].priceList[c][2];
                                                    rowsPagination[i].priceList[c] = priceListItem;
                                                }
                                            }
                                            callback(null, { code: 6000, messages: "product tersedia", dataLength: dataLength, deliveryType: filterDeliveryTimeType, filterCategoryList: filterCategoryProduct, filterBrandList: filterBrandProduct, data: rowsPagination });
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
};

exports.searchProductNoLogin = function(query, callback) {
    var sortingOptionsNoLogin = getSortingQueryNoLogin(query);
    var filterOptions = getFilterByBrandQuery(query);
    var filterStock = getFilterByStockQuery(query);
    var filterCategory = getFilterByCategoryQuery(query);
    var filterDeliveryTime = getFilterByDeliveryTimeQuery(query);

    var finalQueryDataLengthNoLogin = 'SELECT Count(product_delivery_time_type.productDeliveryTimeTypeId) AS dataLength ' +
        'FROM product ' +
        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime;
    db.query(finalQueryDataLengthNoLogin, function(err, rowsDataLengthNoLogin, fields) {
        if (err) callback(err, null);
        else {
            var finalQueryFilterBrandNoLogin = 'SELECT product_brand.productBrandId, product_brand.productBrandDescription ' +
                'FROM product ' +
                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' GROUP BY product.productBrandId';
            db.query(finalQueryFilterBrandNoLogin, function(err, rowsFilterBrandNoLogin, fields) {
                if (err) callback(err, null);
                else {
                    var finalQueryFilterDeliveryTimeTypeNoLogin = 'SELECT product_delivery_time_type.productDeliveryTimeTypeId, product_delivery_time_type.productDeliveryTImeType ' +
                        'FROM product ' +
                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' GROUP BY product_delivery_time_type.productDeliveryTimeTypeId';
                    db.query(finalQueryFilterDeliveryTimeTypeNoLogin, function(err, rowsFilterDeliveryTimeTypeNoLogin, fields) {
                        if (err) callback(err, null);
                        else {
                            var finalQueryFilterCategoryNoLogin = 'SELECT product_category.productCategoryId, product_category.productCategoryDescription ' +
                                'FROM product ' +
                                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + ' GROUP BY product_category.productCategoryId';
                            db.query(finalQueryFilterCategoryNoLogin, function(err, rowsFilterCategoryNoLogin, fields) {
                                if (err) callback(err, null);
                                else {
                                    var dataLength = rowsDataLengthNoLogin[0].dataLength;
                                    var filterBrandProductNoLogin = rowsFilterBrandNoLogin;
                                    var filterDeliveryTimeTypeNoLogin = rowsFilterDeliveryTimeTypeNoLogin;
                                    var filterCategoryProductNoLogin = rowsFilterCategoryNoLogin;
                                    var limit = (query.page - 1) * 10;
                                    var finalQueryNoLogin = 'SELECT product.productId,product.productName,product.productPartNumber,product.productStock,product.productSpesification,product.productDescription, ' +
                                        'product.productWeight,product.productDownloadLink,product_brand.productBrandDescription,product_brand.productBrandImage, ' +
                                        'product_brand.productBrandId,product_category.productCategoryId,product_category.productCategoryDescription, ' +
                                        'product_category.productCategoryImage,product_delivery_time_type.productDeliveryTimeTypeId,product_delivery_time_type.productDeliveryTImeType, ' +
                                        'product_delivery_time_type.productDeliveryTimeValue,product_delivery_time.productDeliveryTimeId,product_delivery_time.productDeliveryTimeMin,product_delivery_time.productDeliveryTimeMax, ' +
                                        'product_delivery_time.productDeliveryTimeMax + product_delivery_time_type.productDeliveryTimeValue AS sortingDeliveryTime ' +
                                        'FROM product ' +
                                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterOptions + filterStock + filterCategory + filterDeliveryTime + sortingOptionsNoLogin + ' LIMIT ' + limit + ',10';
                                    db.query(finalQueryNoLogin, function(err, rowsPaginationNoLogin, fields) {
                                        if (err) callback(err, null);
                                        else {
                                            callback(null, { code: 6000, messages: "product tersedia", dataLength: dataLength, deliveryType: filterDeliveryTimeTypeNoLogin, filterCategoryList: filterCategoryProductNoLogin, filterBrandList: filterBrandProductNoLogin, data: rowsPaginationNoLogin });
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
};

exports.searchProductByPartNumber = function(query, callback) {
    var sortingOptions = getSortingQuery(query);
    var finalQueryDataLengthByPartNumber = 'SELECT ' +
        'Count(product_delivery_time_type.productDeliveryTimeTypeId) AS dataLength ' +
        'FROM  product ' +
        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
        'INNER JOIN product_price ON product_price.productId = product.productId ' +
        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
        'WHERE productPartNumber like "%' + query.searchingkey + '%" GROUP BY product.productId';
    db.query(finalQueryDataLengthByPartNumber, function(err, DataLengthByPartNumber, fields) {
        if (err)
            callback(err, null);
        else {
            var finalQueryDeliveryTypeByPartNumber = 'SELECT ' +
                'product_delivery_time_type.productDeliveryTimeTypeId,product_delivery_time_type.productDeliveryTImeType ' +
                'FROM  product ' +
                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                'INNER JOIN product_price ON product_price.productId = product.productId ' +
                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + ' GROUP BY product_delivery_time_type.productDeliveryTimeTypeId';
            db.query(finalQueryDeliveryTypeByPartNumber, function(err, DeliveryTypeByPartNumber, fields) {
                if (err)
                    callback(err, null);
                else {
                    var finalQueryCategoryByPartNumber = 'SELECT ' +
                        'product_category.productCategoryId, product_category.productCategoryDescription ' +
                        'FROM  product ' +
                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                        'INNER JOIN product_price ON product_price.productId = product.productId ' +
                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + ' GROUP BY product_category.productCategoryId';
                    db.query(finalQueryCategoryByPartNumber, function(err, CategoryByPartNumber, fields) {
                        if (err)
                            callback(err, null);
                        else {
                            var finalQueryBrandByPartNumber = 'SELECT ' +
                                'product_brand.productBrandId, product_brand.productBrandDescription ' +
                                'FROM  product ' +
                                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                'INNER JOIN product_price ON product_price.productId = product.productId ' +
                                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + ' GROUP BY product_brand.productBrandId';
                            db.query(finalQueryBrandByPartNumber, function(err, BrandByPartNumber, fields) {
                                if (err)
                                    callback(err, null);
                                else {
                                    var dataLength = DataLengthByPartNumber.length;
                                    var filterDeliveryTimeTypeAll = DeliveryTypeByPartNumber;
                                    var filterCategoryProductAll = CategoryByPartNumber;
                                    var filterBrandProductAll = BrandByPartNumber;
                                    var limit = (query.page - 1) * 10;
                                    var finalQueryByPartNumber = 'SELECT  ' +
                                        'product.productId,product_brand.productBrandId,product_category.productCategoryId, ' +
                                        'product_price.productPriceId,product_delivery_time_type.productDeliveryTimeTypeId, ' +
                                        'product_delivery_time.productDeliveryTimeId,product.productDescription, ' +
                                        'product.productWeight,product.productDownloadLink,product_brand.productBrandDescription, ' +
                                        'product_brand.productBrandImage,product.productName,product.productPartNumber, ' +
                                        'product.productStock,product.productSpesification,product_category.productCategoryDescription, ' +
                                        'product_category.productCategoryImage,product_delivery_time_type.productDeliveryTImeType,  ' +
                                        'product_delivery_time_type.productDeliveryTimeValue,product_delivery_time.productDeliveryTimeMin, ' +
                                        'product_delivery_time.productDeliveryTimeMax, ' +
                                        'product_delivery_time.productDeliveryTimeMax + product_delivery_time_type.productDeliveryTimeValue AS sortingDeliveryTime, ' +
                                        'GROUP_CONCAT(product_price.productPriceType,' + '":"' + ',product_price.productPrice,' + '":"' + ',product_price.productPriceStatus) AS priceList ' +
                                        'FROM  product ' +
                                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                        'INNER JOIN product_price ON product_price.productId = product.productId ' +
                                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + ' AND product_price.productPriceDisplayStatus="SHOW" GROUP BY product.productId' + sortingOptions + ' LIMIT ' + limit + ',10';
                                    db.query(finalQueryByPartNumber, function(err, rowsByPartNumber, fields) {
                                        if (err) callback(err, null);
                                        else {
                                            var lengthRowsPagination = rowsByPartNumber.length;
                                            for (var i = 0; i < lengthRowsPagination; i++) {
                                                var priceListString = rowsByPartNumber[i].priceList;
                                                rowsByPartNumber[i].priceList = priceListString.split(',');
                                                var priceSplit = rowsByPartNumber[i].priceList;
                                                for (var c = 0; c < priceSplit.length; c++) {
                                                    var priceListSplitString = rowsByPartNumber[i].priceList[c];
                                                    var priceListItem = {
                                                        priceType: "",
                                                        priceValue: 0,
                                                        priceStatus: ""
                                                    };
                                                    rowsByPartNumber[i].priceList[c] = priceListSplitString.split(':');
                                                    priceListItem.priceType = rowsByPartNumber[i].priceList[c][0];
                                                    priceListItem.priceValue = rowsByPartNumber[i].priceList[c][1];
                                                    priceListItem.priceStatus = rowsByPartNumber[i].priceList[c][2];
                                                    rowsByPartNumber[i].priceList[c] = priceListItem;
                                                }
                                            }
                                            callback(null, { code: 6000, messages: "product tersedia", dataLength: dataLength, deliveryType: filterDeliveryTimeTypeAll, filterCategoryList: filterCategoryProductAll, filterBrandList: filterBrandProductAll, data: rowsByPartNumber });
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
};

exports.searchProductByPartNumberNoLogin = function(query, callback) {
    var sortingOptionsNoLogin = getSortingQueryNoLogin(query);
    var finalQueryByPartNumberNoLogin = 'SELECT  ' +
        'Count(product_delivery_time_type.productDeliveryTimeTypeId) AS dataLength  ' +
        'FROM product ' +
        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
        'WHERE productPartNumber like "%' + query.searchingkey + '%"';
    db.query(finalQueryByPartNumberNoLogin, function(err, rowsDataLengthByPartNumberNoLogin, fields) {
        if (err)
            callback(err, null);
        else {
            var finalQueryDeliveryTypeByPartNumberNoLogin = 'SELECT  ' +
                'product_delivery_time_type.productDeliveryTimeTypeId,product_delivery_time_type.productDeliveryTImeType ' +
                'FROM product ' +
                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + ' GROUP BY product_delivery_time_type.productDeliveryTimeTypeId';
            db.query(finalQueryDeliveryTypeByPartNumberNoLogin, function(err, rowsDeliveryTypeByPartNumberNoLogin, fields) {
                if (err)
                    callback(err, null);
                else {
                    var finalQueryCategoryByPartNumberNoLogin = 'SELECT  ' +
                        'product_category.productCategoryId, product_category.productCategoryDescription ' +
                        'FROM product ' +
                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + ' GROUP BY product_category.productCategoryId';
                    db.query(finalQueryCategoryByPartNumberNoLogin, function(err, rowsCategoryByPartNumberNoLogin, fields) {
                        if (err)
                            callback(err, null);
                        else {
                            var finalQueryBrandByPartNumberNoLogin = 'SELECT  ' +
                                'product_brand.productBrandId,product_brand.productBrandDescription ' +
                                'FROM product ' +
                                'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                'WHERE productPartNumber like "%' + query.searchingkey + '%"' + ' GROUP BY product_brand.productBrandId';
                            console.log(finalQueryBrandByPartNumberNoLogin);
                            db.query(finalQueryBrandByPartNumberNoLogin, function(err, rowsBrandByPartNumberNoLogin, fields) {
                                if (err)
                                    callback(err, null);
                                else {
                                    var dataLengthByPartNumberNoLogin = rowsDataLengthByPartNumberNoLogin[0].dataLength;
                                    var filterDeliveryTimeTypeByPartNumberNoLogin = rowsDeliveryTypeByPartNumberNoLogin;
                                    var filterCategoryProductByPartNumberNoLogin = rowsCategoryByPartNumberNoLogin;
                                    var filterBrandProductByPartNumberNoLogin = rowsBrandByPartNumberNoLogin;
                                    var limit = (query.page - 1) * 10;
                                    var finalQueryByPartNumberNoLogi = 'SELECT product.productId,product.productName,product.productPartNumber,product.productStock,product.productSpesification,product.productDescription, ' +
                                        'product.productWeight,product.productDownloadLink,product_brand.productBrandDescription,product_brand.productBrandImage, ' +
                                        'product_brand.productBrandId,product_category.productCategoryId,product_category.productCategoryDescription, ' +
                                        'product_category.productCategoryImage,product_delivery_time_type.productDeliveryTimeTypeId,product_delivery_time_type.productDeliveryTImeType, ' +
                                        'product_delivery_time_type.productDeliveryTimeValue,product_delivery_time.productDeliveryTimeId,product_delivery_time.productDeliveryTimeMin,product_delivery_time.productDeliveryTimeMax, ' +
                                        'product_delivery_time.productDeliveryTimeMax + product_delivery_time_type.productDeliveryTimeValue AS sortingDeliveryTime ' +
                                        'FROM product ' +
                                        'INNER JOIN product_brand ON product.productBrandId = product_brand.productBrandId ' +
                                        'INNER JOIN product_category ON product.productCategoryId = product_category.productCategoryId ' +
                                        'INNER JOIN product_delivery_time ON product_delivery_time.productId = product.productId AND product.productDeliveryTimeId = product_delivery_time.productDeliveryTimeId ' +
                                        'INNER JOIN product_delivery_time_type ON product_delivery_time.productDeliveryTimeTypeId = product_delivery_time_type.productDeliveryTimeTypeId ' +
                                        'WHERE productPartNumber like "%' + query.searchingkey + '%"' + sortingOptionsNoLogin + ' LIMIT ' + limit + ',10';
                                    console.log(finalQueryByPartNumberNoLogi);
                                    db.query(finalQueryByPartNumberNoLogi, function(err, rowsByPartNumberNoLogin, fields) {
                                        if (err) callback(err, null);
                                        else {
                                            callback(null, { code: 6000, messages: "product tersedia", dataLength: dataLengthByPartNumberNoLogin, deliveryType: filterDeliveryTimeTypeByPartNumberNoLogin, filterCategoryList: filterCategoryProductByPartNumberNoLogin, filterBrandList: filterBrandProductByPartNumberNoLogin, data: rowsByPartNumberNoLogin });
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
};

exports.checkingSessionToken = function(query, callback) {
    db.query('SELECT * FROM customer_session WHERE customerEmail = "' + query.email + '"', function(err, rowss, fields) {
        if (err)
            callback(err, null);
        else {
            if (rowss.length > 0) {
                if (query.sessiontoken === rowss[0].customerToken) {
                    callback(null, { code: 9000, messages: "masih login" });
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

function getSortingQuery(query) {
    if (query.sortingOption == 0) {
        return PRODUCT_ORDER_BY_PRICE;
    } else if (query.sortingOption == 1) {
        return PRODUCT_ORDER_BY_STOCK;
    } else if (query.sortingOption == 2) {
        return PRODUCT_ORDER_BY_DELIVERY_TIME;
    } else {
        return "";
    }
}

function getSortingQueryNoLogin(query) {
    if (query.sortingOption == 1) {
        return PRODUCT_ORDER_BY_STOCK;
    } else if (query.sortingOption == 2) {
        return PRODUCT_ORDER_BY_DELIVERY_TIME;
    } else {
        return "";
    }
}
//begin brand function
function getFilterByBrandQuery(query) {
    if (query.brandFilter) {
        return QUERY_AND_STRING + QUERY_OPEN_CLOSURE_STRING + getFilterByBrandOptionsQuery(query.brandFilter) + QUERY_CLOSE_CLOSURE_STRING;
    } else {
        return "";
    }
}

function getFilterByBrandOptionsQuery(brandFilter) {
    var brandFilterList = getQueryOptionsByDelimitter(brandFilter);
    var resultQuery = getMultipleFilterQueryOptions(brandFilterList, PRODUCT_FILTER_BY_BRAND_COLUMN);
    return getMultipleFilterQueryOptions(brandFilterList, PRODUCT_FILTER_BY_BRAND_COLUMN);
}

function getQueryOptionsByDelimitter(source) {
    return source.split(QUERY_FILTER_OPTIONS_DELIMITTER);
}

function getMultipleFilterQueryOptions(filterOptions, columnName) {
    var resultQuery = "";
    if (filterOptions.length == 1) {
        return getSingleQueryOption(columnName, filterOptions);
    } else {
        for (i = 0; i < filterOptions.length; i++) {
            resultQuery += getSingleQueryOption(columnName, filterOptions[i]);
            if (i < (filterOptions.length - 1)) {
                resultQuery += QUERY_OR_STRING;
            }
        }
    }
    return resultQuery;
}

function getSingleQueryOption(columnName, value) {
    return columnName + QUERY_EQUALS_STRING + value;
}
//end brand function

//begin stock function
function getFilterByStockQuery(query) {
    if (query.stocks) {
        return QUERY_AND_STRING + getFilterStockOptionsQuery(query.stocks);
    } else {
        return "";
    }
}

function getFilterStockOptionsQuery(stockFilter) {
    var resultStockQuery = getStockFilterQueryOptions(stockFilter, PRODUCT_FILTER_BY_STOCK_COLUMN);
    return getStockFilterQueryOptions(stockFilter, PRODUCT_FILTER_BY_STOCK_COLUMN);
}

function getStockFilterQueryOptions(filterStock, columnName) {
    return getSingleStockQueryOption(columnName, filterStock);
}

function getSingleStockQueryOption(columnName, value) {
    return columnName + value;
}
// End stock function

// Begin Category Function
function getFilterByCategoryQuery(query) {
    if (query.categoryFilter) {
        return QUERY_AND_STRING + QUERY_OPEN_CLOSURE_STRING + getFilterByCategoryOptionsQuery(query.categoryFilter) + QUERY_CLOSE_CLOSURE_STRING;
    } else {
        return "";
    }
}

function getFilterByCategoryOptionsQuery(categoryFilter) {
    var categoryFilterList = getQueryOptionsByDelimitter(categoryFilter);
    var resultCategoryQuery = getMultipleCategoryFilterQueryOptions(categoryFilterList, PRODUCT_FILTER_BY_CATEGORY_COLUMN);
    return getMultipleCategoryFilterQueryOptions(categoryFilterList, PRODUCT_FILTER_BY_CATEGORY_COLUMN);
}

function getMultipleCategoryFilterQueryOptions(filterCategory, columnName) {
    var resultCategoryQuery = "";
    if (filterCategory.length == 1) {
        return getSingleCategoryQueryOption(columnName, filterCategory);
    } else {
        for (i = 0; i < filterCategory.length; i++) {
            resultCategoryQuery += getSingleCategoryQueryOption(columnName, filterCategory[i]);
            if (i < (filterCategory.length - 1)) {
                resultCategoryQuery += QUERY_OR_STRING;
            }
        }
    }
    return resultCategoryQuery;
}

function getSingleCategoryQueryOption(columnName, value) {
    return columnName + QUERY_EQUALS_STRING + value;
}
//end Category function
//begin Delivery Time function
function getFilterByDeliveryTimeQuery(query) {
    if (query.deliveryTimeFilter) {
        return QUERY_AND_STRING + QUERY_OPEN_CLOSURE_STRING + getFilterByDeliveryTimeOptionsQuery(query.deliveryTimeFilter) + QUERY_CLOSE_CLOSURE_STRING;
    } else {
        return "";
    }
}

function getFilterByDeliveryTimeOptionsQuery(deliveryTimeFilter) {
    var deliveryTimeFilterList = getQueryOptionsByDelimitter(deliveryTimeFilter);
    var resultDeliveryTimeQuery = getMultipleDeliveryTimeFilterQueryOptions(deliveryTimeFilterList, PRODUCT_FILTER_BY_DELIVERY_TIME_COLUMN);
    return getMultipleDeliveryTimeFilterQueryOptions(deliveryTimeFilterList, PRODUCT_FILTER_BY_DELIVERY_TIME_COLUMN);
}

function getQueryOptionsByDelimitter(source) {
    return source.split(QUERY_FILTER_OPTIONS_DELIMITTER);
}

function getMultipleDeliveryTimeFilterQueryOptions(filterDeliveryTime, columnName) {
    var resultDeliveryTimeQuery = "";
    if (filterDeliveryTime.length == 1) {
        return getSingleDeliveryTimeQueryOption(columnName, filterDeliveryTime);
    } else {
        for (i = 0; i < filterDeliveryTime.length; i++) {
            resultDeliveryTimeQuery += getSingleDeliveryTimeQueryOption(columnName, filterDeliveryTime[i]);
            if (i < (filterDeliveryTime.length - 1)) {
                resultDeliveryTimeQuery += QUERY_OR_STRING;
            }
        }
    }
    return resultDeliveryTimeQuery;
}

function getSingleDeliveryTimeQueryOption(columnName, value) {
    return columnName + QUERY_EQUALS_STRING + value;
}
//end brand function