app = require('../../../../indexApps');
db = app.db;

var date = require('date-and-time');
var md5 = require('md5');
var nodemailer = require('nodemailer');
var xoauth2 = require('xoauth2');

exports.EmailForgotPassword = function(query, callback) {
    db.query("SELECT * from customer_account WHERE customerEmail = " + "'" + query.email + "'", function(err, rows, fields) {
        if (err) {
            callback(err, null);
            console.log(err);
        } else {
            if (rows.length > 0) {
                var customerEmail = rows[0].customerEmail;
                db.query("SELECT * from customer_forgot_password WHERE customerEmail = " + "'" + customerEmail + "'", function(err, rowss, fields) {
                    if (err) {
                        callback(err, null);
                        console.log(err);
                    } else {
                        if (rowss.length > 0) {
                            var customerUpdateForgotPasswordTime = new Date();
                            var customerForgotPasswordCode = md5(customerEmail + customerUpdateForgotPasswordTime);
                            var customerUpdateForgotPasswordExpired = date.addMinutes(customerUpdateForgotPasswordTime, 30);
                            var customerLimitEmailSendTime = date.addDays(customerUpdateForgotPasswordTime, 1);
                            var customerLimitEmailSendNumber = rowss[0].customerLimitEmailSendNumber + 1;
                            if (rowss[0].customerLimitEmailSendNumber > 3) {
                                if (customerUpdateForgotPasswordTime < rowss[0].customerLimitEmailSendTime) {
                                    console.log(rowss);
                                    callback(null, { code: 7005, messages: "batas melakukan forgot password telah habis" });
                                } else {
                                    var customerLimitEmailSendNumber = 1;
                                    var post1 = {
                                        customerForgotPasswordCode: customerForgotPasswordCode,
                                        customerUpdateForgotPasswordTime: customerUpdateForgotPasswordTime,
                                        customerUpdateForgotPasswordExpired: customerUpdateForgotPasswordExpired,
                                        customerLimitEmailSendNumber: customerLimitEmailSendNumber,
                                        customerLimitEmailSendTime: customerLimitEmailSendTime
                                    };
                                    db.query("UPDATE customer_forgot_password set ? WHERE customerEmail = " + "'" + customerEmail + "'", post1, function(err, rows, fields) {
                                        if (err)
                                            callback(err, null);
                                        else {
                                            db.query("SELECT * from customer_forgot_password WHERE customerEmail = " + "'" + customerEmail + "'", function(err, rowssss, fields) {
                                                if (err)
                                                    callback(err, null);
                                                else {
                                                    var confirmCode = rowssss[0].customerForgotPasswordCode;
                                                    var customerEmail = rowssss[0].customerEmail;
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
                                                        to: customerEmail,
                                                        subject: 'Confirm your account',
                                                        html: '<p>Please verify your account by clicking <a href="' + query.forgetPasswordUri + '' + '/resetpassword?code=' + confirmCode + '">this link</a>. If you are unable to do so, copy and ' +
                                                            'paste the following link into your browser:</p><p>' + query.forgetPasswordUri + '' + '/resetpassword?code=' + confirmCode + '</p>',
                                                        text: 'Please verify your account by clicking the following link, or by copying and pasting it into your browser: ' + query.forgetPasswordUri + '/resetpassword?code=' + confirmCode + ''
                                                    };
                                                    smtpTransport.sendMail(mailOptions, function(error, info) {
                                                        if (error) {
                                                            console.log(error);
                                                        } else {
                                                            console.log('Email sent: ' + info.response);
                                                        }
                                                    });
                                                    console.log(rowssss);
                                                    callback(null, { code: 7000, messages: "limit forgot password masih tersedia", data: rowssss });
                                                }
                                            });
                                        }
                                    });
                                }
                            } else {
                                var post1 = {
                                    customerForgotPasswordCode: customerForgotPasswordCode,
                                    customerUpdateForgotPasswordTime: customerUpdateForgotPasswordTime,
                                    customerUpdateForgotPasswordExpired: customerUpdateForgotPasswordExpired,
                                    customerLimitEmailSendNumber: customerLimitEmailSendNumber,
                                    customerLimitEmailSendTime: customerLimitEmailSendTime
                                };
                                db.query("UPDATE customer_forgot_password set ? WHERE customerEmail = " + "'" + customerEmail + "'", post1, function(err, rows, fields) {
                                    if (err)
                                        callback(err, null);
                                    else {
                                        db.query("SELECT * from customer_forgot_password WHERE customerEmail = " + "'" + customerEmail + "'", function(err, rowssss, fields) {
                                            if (err)
                                                callback(err, null);
                                            else {
                                                var confirmCode = rowssss[0].customerForgotPasswordCode;
                                                var customerEmail = rowssss[0].customerEmail;
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
                                                    to: customerEmail,
                                                    subject: 'Confirm your account',
                                                    html: '<p>Please verify your account by clicking <a href="' + query.forgetPasswordUri + '' + '/resetpassword?code=' + confirmCode + '">this link</a>. If you are unable to do so, copy and ' +
                                                        'paste the following link into your browser:</p><p>' + query.forgetPasswordUri + '' + '/resetpassword?code=' + confirmCode + '</p>',
                                                    text: 'Please verify your account by clicking the following link, or by copying and pasting it into your browser: ' + query.forgetPasswordUri + '/resetpassword?code=' + confirmCode + ''
                                                };
                                                smtpTransport.sendMail(mailOptions, function(error, info) {
                                                    if (error) {
                                                        console.log(error);
                                                    } else {
                                                        console.log('Email sent: ' + info.response);
                                                    }
                                                });
                                                console.log(rowssss);
                                                callback(null, { code: 7000, messages: "limit forgot password masih tersedia", data: rowssss });
                                            }
                                        });
                                    }
                                });
                            }
                        } else {
                            var customerUpdateForgotPasswordTime = new Date();
                            var customerForgotPasswordCode = md5(customerEmail + customerUpdateForgotPasswordTime);
                            var customerUpdateForgotPasswordExpired = date.addMinutes(customerUpdateForgotPasswordTime, 30);
                            var customerLimitEmailSendTime = date.addDays(customerUpdateForgotPasswordTime, 1);
                            var customerLimitEmailSendNumber = 1;
                            var post2 = {
                                customerEmail: customerEmail,
                                customerForgotPasswordCode: customerForgotPasswordCode,
                                customerUpdateForgotPasswordTime: customerUpdateForgotPasswordTime,
                                customerUpdateForgotPasswordExpired: customerUpdateForgotPasswordExpired,
                                customerLimitEmailSendNumber: customerLimitEmailSendNumber,
                                customerLimitEmailSendTime: customerLimitEmailSendTime
                            };
                            db.query('INSERT INTO customer_forgot_password set ? ', post2, function(err, rowsss, fields) {
                                if (err)
                                    callback(err, null);
                                else {
                                    db.query("SELECT * from customer_forgot_password WHERE customerEmail = " + "'" + customerEmail + "'", function(err, rowssssss, fields) {
                                        if (err)
                                            callback(err, null);
                                        else {
                                            var confirmCode = rowssssss[0].customerForgotPasswordCode;
                                            var customerEmail = rowssssss[0].customerEmail;
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
                                                to: customerEmail,
                                                subject: 'Confirm your account',
                                                html: '<p>Please verify your account by clicking <a href="' + query.forgetPasswordUri + '' + '/resetpassword?code=' + confirmCode + '">this link</a>. If you are unable to do so, copy and ' +
                                                    'paste the following link into your browser:</p><p>' + query.forgetPasswordUri + '' + '/resetpassword?code=' + confirmCode + '</p>',
                                                text: 'Please verify your account by clicking the following link, or by copying and pasting it into your browser: ' + query.forgetPasswordUri + '/resetpassword?code=' + confirmCode + ''
                                            };
                                            smtpTransport.sendMail(mailOptions, function(error, info) {
                                                if (error) {
                                                    console.log(error);
                                                } else {
                                                    console.log('Email sent: ' + info.response);
                                                }
                                            });
                                            console.log(rowssssss);
                                            callback(null, { code: 7000, messages: "email ada", data: rowssssss });
                                        }
                                    });
                                }
                            });
                        }
                    }
                });
            } else {
                console.log(rows);
                callback(null, { nothingEmail: true });
            }
        }
    });
};