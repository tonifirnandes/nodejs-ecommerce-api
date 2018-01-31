app = require('../../../indexApps');
var moment = require('moment');
var groupArray = require('group-array');
var math = require('mathjs');
db = app.db;

var QUERY_AND_STRING = " AND ";
var PRODUCT_FILTER_BY_STOCK_COLUMN = "productStock > ";

exports.checkingSessionToken = function(query, callback) {
    return new Promise(function(resolve, reject) {
        db.query('SELECT * FROM customer_session WHERE customerEmail = "' + query.email + '"', function(err, rows, fields) {
            if (err) {
                return reject(err);
            } else {
                if (rows.length > 0) {
                    if (query.sessiontoken === rows[0].customerToken) {
                        callback(null, { code: 9000, messages: "masih login" });
                    } else {
                        callback(null, { messages: "sudah tidak login" });
                    }
                } else {
                    callback(null, { messages: "sudah tidak login" });
                }
            }
        });
    });
};
exports.searchProductLoginPromise = function(query, callback) {
    var filterStock = getFilterByStockQuery(query);
    var finalQuerySearchProduct = 'SELECT productId, productName, productPartNumber, productStock, productWeight, productPriceNow, productImagesPath,productBrandId ' +
        'FROM  product_' + query.productBrandId +
        ' WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterStock;
    return new Promise(function(resolve, reject) {
        db.query(finalQuerySearchProduct, function(err, rows, fields) {
            if (err) {
                return reject(err);
            } else {
                resolve(rows);
            }
        });
    });
};

exports.searchProductNoLoginPromise = function(query) {
    var filterStock = getFilterByStockQuery(query);
    var finalQuerySearchProduct = 'SELECT productId, productName, productPartNumber, productStock, productWeight, productImagesPath,productBrandId ' +
        'FROM  product_' + query.productBrandId +
        ' WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterStock;
    return new Promise(function(resolve, reject) {
        db.query(finalQuerySearchProduct, function(err, rows, fields) {
            if (err) {
                reject(err);
            } else {
                resolve(rows);
            }
        });
    });
};

// exports.checkingSessionToken = function(query, callback) {
//     db.query('SELECT * FROM customer_session WHERE customerEmail = "' + query.email + '"', function(err, rowss, fields) {
//         if (err)
//             callback(err, null);
//         else {
//             if (rowss.length > 0) {
//                 if (query.sessiontoken === rowss[0].customerToken) {
//                     callback(null, { code: 9000, messages: "masih login" });
//                 } else {
//                     callback(null, { messages: "sudah tidak login" });
//                 }
//             } else {
//                 callback(null, { messages: "sudah tidak login" });
//             }

//         }
//     });
// };
// exports.searchProductLogin = function(query, callback) {
//     var filterStock = getFilterByStockQuery(query);
//     var finalQuerySearchProduct = 'SELECT productId, productName, productPartNumber, productStock, productWeight, productPriceNow, productImagesPath,productBrandId ' +
//         'FROM  product_' + query.productBrandId +
//         ' WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterStock;
//     db.query(finalQuerySearchProduct, function(err, resultQuerySearchProduct, fields) {
//         if (err) callback(err, null);
//         else {
//             callback(null, { code: 6000, messages: "product tersedia", data: resultQuerySearchProduct });
//         }
//     });
// };
// exports.searchProductNoLogin = function(query, callback) {
//     var filterStock = getFilterByStockQuery(query);
//     var finalQuerySearchProduct = 'SELECT productId, productName, productPartNumber, productStock, productWeight, productImagesPath,productBrandId ' +
//         'FROM  product_' + query.productBrandId +
//         ' WHERE productPartNumber like "%' + query.searchingkey + '%"' + filterStock;
//     db.query(finalQuerySearchProduct, function(err, resultQuerySearchProduct, fields) {
//         if (err) callback(err, null);
//         else {
//             callback(null, { code: 6000, messages: "product tersedia", data: resultQuerySearchProduct });
//         }
//     });
// };

//start stock function
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