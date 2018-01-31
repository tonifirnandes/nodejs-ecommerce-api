app = require('../../../indexApps');
var moment = require('moment');
db = app.db;


exports.addCustomerPersonalInfo = function(query, callback) {

    var post1 = {
        customerEmail: query.email,
        customerGender: query.gender,
        customerNpwp: query.npwp
    };
    var post2 = {
        customerEmail: query.email,
        customerAddress: query.customerAddress,
        customerAddressZipcode: query.customerAddressZipcode
    };
    db.query('INSERT INTO customer_personal_info set ? ', post1, function(err, rows, fields) {
        if (err)
            callback(err, null);
        else {
            db.query('INSERT INTO customer_address set ? ', post2, function(err, rows, fields) {
                if (err)
                    callback(err, null);
                else {
                    callback(null, rows);
                    console.log(rows);
                }
            });
        }
    });
};
exports.customerPhoneNumberCheck = function(query, callback) {
    db.query("SELECT customerPhoneNumber, CustomerEmail from customer_personal_info WHERE customerPhoneNumber = " +
        "'" + query.phoneNumber + "'" + "AND customerEmail = " +
        "'" + query.email + "'",
        function(err, rows, fields) {
            if (err)
                callback(err, null);
            else {
                if (rows[0]) {
                    console.log(rows);
                    callback(null, { ada: true });
                } else {
                    console.log(rows);
                    callback(null, { ada: false });
                }
            }
        });
};