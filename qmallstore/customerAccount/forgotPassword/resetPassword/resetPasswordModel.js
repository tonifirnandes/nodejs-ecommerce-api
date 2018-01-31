app = require('../../../../indexApps');
db = app.db;

var date = require('date-and-time');
var md5 = require('md5');
var nodemailer = require('nodemailer');
var xoauth2 = require('xoauth2');
var bcrypt = require('bcryptjs');
const saltRounds = 10;

exports.resetPassword = function(query, callback) {
    db.query("SELECT * from customer_forgot_password WHERE customerForgotPasswordCode = " + "'" + query.customerForgotPasswordCode + "'", function(err, rows, fields) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            if (rows.length > 0) {
                var customerEmail = rows[0].customerEmail;
                bcrypt.genSalt(saltRounds, function(err, salt) {
                    bcrypt.hash(query.password, salt, function(err, hash) {
                        if (err) callback(err, null);
                        else {
                            var now = new Date();
                            if (now > rows[0].customerUpdateForgotPasswordExpired) {
                                callback(null, { code: 8005, messages: "anda terlalu lama melakukan verifikasi email" });
                            } else {
                                var post1 = {
                                    customerPassword: hash
                                };
                                db.query("UPDATE customer_account set ? WHERE customerEmail = " + "'" + customerEmail + "'", post1, function(err, rowss, fields) {
                                    if (err) {
                                        callback(err, null);
                                        console.log(err);
                                    } else {
                                        console.log(rowss);
                                        callback(null, { code: 8000, messages: "change password success", data: rowss });
                                    }
                                });
                            }

                        }
                    });
                });
            } else {
                console.log(rows);
                callback(null, { nothingCode: true });
            }
        }
    });
};