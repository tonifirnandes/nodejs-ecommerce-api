app = require('../../../indexApps');
db = app.db;

var date = require('date-and-time');
var bcrypt = require('bcryptjs');
var date = require('date-and-time');
var md5 = require('md5');

exports.loginCustomerCheck = function(query, callback) {
    db.query("SELECT * from customer_account WHERE customerEmail = " + "'" + query.email + "'" + " OR customerPhoneNumber =" + "'" + query.email + "'", function(err, rows, fields) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            if (rows.length > 0) {
                var customerPassword = rows[0].customerPassword;
                var customerPhoneNumber = rows[0].customerPhoneNumber;
                var customerEmail = rows[0].customerEmail;
                bcrypt.compare(query.customerPassword, customerPassword, function(err, res) {
                    if (res === true) {
                        db.query("SELECT * from customer_session WHERE customerEmail = " + "'" + query.email + "'" + " OR customerPhoneNumber =" + "'" + query.email + "'", function(err, rows, fields) {
                            if (err)
                                callback(err, null);
                            else {
                                if (rows.length > 0) {
                                    var updateTimeCustomerSession = new Date();
                                    let expireTimeCustomerSession = date.addMonths(updateTimeCustomerSession, 3);
                                    var customerToken = md5(query.email + updateTimeCustomerSession + customerAccess);
                                    var post1 = {
                                        updateTimeCustomerSession: updateTimeCustomerSession,
                                        expireTimeCustomerSession: expireTimeCustomerSession,
                                        customerToken: customerToken
                                    };
                                    db.query("UPDATE customer_session set ? WHERE customerEmail = " + "'" + query.email + "'" + " OR customerPhoneNumber =" + "'" + query.email + "'", post1, function(err, rows, fields) {
                                        if (err)
                                            callback(err, null);
                                        else {
                                            db.query("SELECT * from customer_session WHERE customerEmail = " + "'" + query.email + "'" + " OR customerPhoneNumber =" + "'" + query.email + "'", function(err, rows, fields) {
                                                if (err)
                                                    callback(err, null);
                                                else {
                                                    console.log(res);
                                                    callback(null, { code: 7000, messages: "login sukses", data: rows });
                                                }
                                            });
                                        }
                                    });
                                } else {
                                    var updateTimeCustomerSession = new Date();
                                    let expireTimeCustomerSession = date.addMonths(updateTimeCustomerSession, 3);
                                    var customerAccess = "UNBLOCK";
                                    var customerToken = md5(query.email + updateTimeCustomerSession + customerAccess);
                                    var post = {
                                        updateTimeCustomerSession: updateTimeCustomerSession,
                                        customerEmail: customerEmail,
                                        customerPhoneNumber: customerPhoneNumber,
                                        expireTimeCustomerSession: expireTimeCustomerSession,
                                        customerAccess: customerAccess,
                                        customerToken: customerToken
                                    };
                                    db.query('INSERT INTO customer_session set ? ', post, function(err, rows, fields) {
                                        if (err)
                                            callback(err, null);
                                        else {
                                            db.query("SELECT * from customer_session WHERE customerEmail = " + "'" + query.email + "'" + " OR customerPhoneNumber =" + "'" + query.email + "'", function(err, rows, fields) {
                                                if (err)
                                                    callback(err, null);
                                                else {
                                                    console.log(res);
                                                    callback(null, { code: 7000, messages: "login sukses", data: rows });
                                                }
                                            });
                                        }
                                    });
                                }
                            }
                        });
                    } else {
                        callback(null, { code: 7002, messages: "password dan email tidak cocok" });
                    }
                });
            } else {
                console.log(rows);
                callback(null, { nothingEmail: true });
            }
        }
    });
};