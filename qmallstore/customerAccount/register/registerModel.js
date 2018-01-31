app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

var date = require('date-and-time');
var bcrypt = require('bcryptjs');
var nodemailer = require('nodemailer');
var xoauth2 = require('xoauth2');
var md5 = require('md5');
var Nexmo = require('nexmo');
var nexmo = new Nexmo({
    apiKey: '25b8c2d1',
    apiSecret: '6500f60aeeec581b',
}, { debug: true });
var rn = require('random-number');
const saltRounds = 10;

exports.registerCustomerEmail = function(query, callback) {
    bcrypt.genSalt(saltRounds, function(err, salt) {
        bcrypt.hash(query.password, salt, function(err, hash) {
            // Store hash in your password DB.
            if (err)
                callback(err, null);
            else {
                var verificationAccountStatus = 'N';
                var confirmCode = md5(query.email);
                var OtpCode = rn.generator({
                    min: 1000,
                    max: 10000,
                    integer: true
                })
                var UpdateOtpTime = new Date();
                let UpdateOtpExpired = date.addMinutes(UpdateOtpTime, 5);
                var LimitNumberResend = 1;
                var LimitTime = new Date();
                var post = {
                    customerEmail: query.email,
                    customerPassword: hash,
                    customerConfirmPassword: hash,
                    customerAccountStatus: verificationAccountStatus,
                    customerPhoneNumber: query.phoneNumber,
                    customerOtpCode: OtpCode(),
                    customerUpdateOtpTime: UpdateOtpTime,
                    customerUpdateOtpExpired: UpdateOtpExpired,
                    customerLimitNumberResend: LimitNumberResend,
                    customerLimitTime: LimitTime,
                    customerCodeEmailVerification: confirmCode
                };
                db.query('INSERT INTO customer_register_account set ? ', post, function(err, rows, fields) {
                    if (err)
                        callback(err, null);
                    else {
                        var smtpTransport = nodemailer.createTransport({
                            service: "Gmail",
                            auth: {
                                type: 'OAuth2',
                                user: 'sistemseikiaditama@gmail.com',
                                clientId: '226927731506-rhqofafkejagpe18oarvalv4ginbpc75.apps.googleusercontent.com',
                                clientSecret: 'SPaWTnz9umjSleavWZKU-rpr',
                                refreshToken: '1/JJ0VfpD0hbbhaaAHoTCxyVN7tlifgY-82aV0JxHDhZo'
                            }
                        });
                        var mailOptions = {
                            from: 'Do Not Reply <sistemseikiaditama@gmail.com>',
                            to: query.email,
                            subject: 'Confirm your account',
                            html: '<p>Please verify your account by clicking <a href="' + query.registerUri + '' + '/verificationcode?code=' + confirmCode + '">this link</a>. If you are unable to do so, copy and ' +
                                'paste the following link into your browser:</p><p>' + query.registerUri + '' + '/verificationcode?code=' + confirmCode + '</p>',
                            text: 'Please verify your account by clicking the following link, or by copying and pasting it into your browser: ' + query.registerUri + '/verificationcode?code=' + confirmCode + ''
                        };
                        smtpTransport.sendMail(mailOptions, function(error, info) {
                            if (error) {
                                console.log(error);
                            } else {
                                console.log('Email sent: ' + info.response);
                            }
                        });
                        db.query("SELECT customerOtpCode from customer_register_account WHERE customerEmail = " +
                            "'" + query.email + "'",
                            function(err, rows, fields) {
                                if (err)
                                    callback(err, null);
                                else {
                                    var i = rows[0].customerOtpCode;
                                    nexmo.message.sendSms(
                                        '6282218155500', query.phoneNumber, i, { type: 'unicode' },
                                        (err, responseData) => { if (responseData) { console.log(responseData) } }
                                    );
                                    callback(null, rows);
                                    console.log(rows);
                                }
                            });
                    }

                });
            }
        });
    });
};
exports.customerEmailCheck = function(query, callback) {
    db.query("SELECT * from customer_register_account WHERE customerEmail = " +
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
exports.customerAccountCheck = function(query, callback) {
    db.query("SELECT * from customer_register_account WHERE customerAccountStatus = 'Y' AND customerEmail = " + "'" + query.email + "' AND customerPhoneNumber = " + "'" + query.phoneNumber + "'",
        function(err, rows, fields) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
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