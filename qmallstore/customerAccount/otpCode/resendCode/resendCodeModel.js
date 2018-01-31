app = require('../../../../indexApps');
db = app.db;

var date = require('date-and-time');
var rn = require('random-number');

var Nexmo = require('nexmo');
var nexmo = new Nexmo({
    apiKey: '25b8c2d1',
    apiSecret: '6500f60aeeec581b',
}, { debug: true });

exports.limitCheck = function(query, callback) {
    db.query("SELECT * from customer_register_account WHERE customerCodeEmailVerification = " +
        "'" + query.emailCode + "'",
        function(err, rows, fields) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                if (rows[0].customerLimitNumberResend > 3) {
                    var resendLimitTime = new Date();
                    if (resendLimitTime < rows[0].customerLimitTime) {
                        console.log(rows);
                        callback(null, { resendafter: false });
                    } else {
                        console.log(rows);
                        callback(null, { resendafter: true });
                    }
                } else {
                    console.log(rows);
                    callback(null, { resendok: true });
                }
            }
        });
};
exports.updateOtpCode = function(query, callback) {
    db.query("SELECT * from customer_register_account WHERE customerCodeEmailVerification = " +
        "'" + query.emailCode + "'",
        function(err, rows, fields) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                var OtpCode = rn.generator({
                    min: 1000,
                    max: 10000,
                    integer: true
                })
                var UpdateOtpTime = new Date();
                let UpdateOtpExpired = date.addMinutes(UpdateOtpTime, 5);
                var LimitNumberResend = 1 + rows[0].customerLimitNumberResend;
                var LimitTime = date.addDays(UpdateOtpTime, 1);
                var post = {
                    customerOtpCode: OtpCode(),
                    customerUpdateOtpTime: UpdateOtpTime,
                    customerUpdateOtpExpired: UpdateOtpExpired,
                    customerLimitNumberResend: LimitNumberResend,
                    customerLimitTime: LimitTime
                };
                db.query("UPDATE customer_register_account SET ? WHERE customerCodeEmailVerification = " +
                    "'" + query.emailCode + "'", post,
                    function(err, rows, fields) {
                        if (err) {
                            callback(err, null);
                            console.log(err);
                        } else {
                            db.query("SELECT customerOtpCode,customerPhoneNumber from customer_register_account WHERE customerCodeEmailVerification = " +
                                "'" + query.emailCode + "'",
                                function(err, rows, fields) {
                                    if (err)
                                        callback(err, null);
                                    else {
                                        var i = rows[0].customerOtpCode;
                                        var ii = rows[0].customerPhoneNumber;
                                        nexmo.message.sendSms(
                                            '6282218155500', ii, i, { type: 'unicode' },
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
};

exports.updateOtpCodeAfter = function(query, callback) {
    var OtpCode = rn.generator({
        min: 1000,
        max: 10000,
        integer: true
    })
    var UpdateOtpTime = new Date();
    let UpdateOtpExpired = date.addMinutes(UpdateOtpTime, 5);
    var LimitNumberResend = 1;
    var LimitTime = date.addDays(UpdateOtpTime, 1);
    var post = {
        customerOtpCode: OtpCode(),
        customerUpdateOtpTime: UpdateOtpTime,
        customerUpdateOtpExpired: UpdateOtpExpired,
        customerLimitNumberResend: LimitNumberResend,
        customerLimitTime: LimitTime
    };
    db.query("UPDATE customer_register_account SET ? WHERE customerCodeEmailVerification = " +
        "'" + query.emailCode + "'", post,
        function(err, rows, fields) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                db.query("SELECT customerOtpCode,customerPhoneNumber from customer_register_account WHERE customerCodeEmailVerification = " +
                    "'" + query.emailCode + "'",
                    function(err, rows, fields) {
                        if (err)
                            callback(err, null);
                        else {
                            var i = rows[0].customerOtpCode;
                            var ii = rows[0].customerPhoneNumber;
                            nexmo.message.sendSms(
                                '6282218155500', ii, i, { type: 'unicode' },
                                (err, responseData) => { if (responseData) { console.log(responseData) } }
                            );
                            callback(null, rows);
                            console.log(rows);
                        }
                    });
            }
        });
};