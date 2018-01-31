app = require('../../../../indexApps');
var moment = require('moment');
db = app.db;

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
exports.getTopViewingLogin = function(query, callback) {
    var finalQueryTopViewing = 'SELECT ' +
        'product_top_' + query.productBrandId + '.viewingNumber, ' +
        'product_' + query.productBrandId + '.productName, ' +
        'product_top_' + query.productBrandId + '.productId, ' +
        'product_' + query.productBrandId + '.productStock, ' +
        'product_' + query.productBrandId + '.productPartNumber, ' +
        'product_' + query.productBrandId + '.productWeight, ' +
        'product_' + query.productBrandId + '.productBrandId, ' +
        'product_' + query.productBrandId + '.productPriceNow, ' +
        'product_' + query.productBrandId + '.productImagesPath ' +
        'FROM ' +
        'product_top_' + query.productBrandId +
        ' INNER JOIN product_' + query.productBrandId + ' ON product_top_' + query.productBrandId + '.productId = product_' + query.productBrandId + '.productId ' +
        'ORDER BY ' +
        'product_top_' + query.productBrandId + '.viewingNumber DESC ' +
        'LIMIT 4';
    console.log(finalQueryTopViewing);
    db.query(finalQueryTopViewing, function(err, resultQueryTopViewing, fields) {
        if (err) callback(err, null);
        else callback(null, resultQueryTopViewing);
    });
};
exports.getTopViewingNoLogin = function(query, callback) {
    var finalQueryTopViewing = 'SELECT ' +
        'product_top_' + query.productBrandId + '.viewingNumber, ' +
        'product_' + query.productBrandId + '.productName, ' +
        'product_top_' + query.productBrandId + '.productId, ' +
        'product_' + query.productBrandId + '.productStock, ' +
        'product_' + query.productBrandId + '.productPartNumber, ' +
        'product_' + query.productBrandId + '.productWeight, ' +
        'product_' + query.productBrandId + '.productBrandId, ' +
        'product_' + query.productBrandId + '.productImagesPath ' +
        'FROM ' +
        'product_top_' + query.productBrandId +
        ' INNER JOIN product_' + query.productBrandId + ' ON product_top_' + query.productBrandId + '.productId = product_' + query.productBrandId + '.productId ' +
        'ORDER BY ' +
        'product_top_' + query.productBrandId + '.viewingNumber DESC ' +
        'LIMIT 4';
    console.log(finalQueryTopViewing);
    db.query(finalQueryTopViewing, function(err, resultQueryTopViewing, fields) {
        if (err) callback(err, null);
        else callback(null, resultQueryTopViewing);
    });
};