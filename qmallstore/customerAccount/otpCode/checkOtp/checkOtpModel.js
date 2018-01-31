app = require('../../../../indexApps');
db = app.db;

var date = require('date-and-time');
exports.otpCodeCheck = function(query, callback) {
    db.query("SELECT * from customer_register_account WHERE customerCodeEmailVerification = " +
        "'" + query.emailCode + "'",
        function(err, rows, fields) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                var UpdateOtpTime = new Date();
                if (UpdateOtpTime < rows[0].customerUpdateOtpExpired) {
                    if (query.otpCode == rows[0].customerOtpCode) {
                        var verificationAccountStatus = 'Y';
                        var post = {
                            customerAccountStatus: verificationAccountStatus
                        };
                        db.query("UPDATE customer_register_account SET ? WHERE customerCodeEmailVerification = " +
                            "'" + query.emailCode + "'", post,
                            function(err, rows, fields) {
                                if (err) {
                                    callback(err, null);
                                    console.log(err);
                                } else {
                                    db.query("SELECT * from customer_register_account WHERE customerCodeEmailVerification = " +
                                        "'" + query.emailCode + "'",
                                        function(err, rowsssss, fields) {
                                            if (err) {
                                                callback(err, null);
                                                console.log(err);
                                            } else {
                                                var post = {
                                                    customerEmail: rowsssss[0].customerEmail,
                                                    customerPassword: rowsssss[0].customerPassword,
                                                    customerPhoneNumber: rowsssss[0].customerPhoneNumber
                                                };
                                                db.query('INSERT INTO customer_account set ? ', post, function(err, rowsss, fields) {
                                                    if (err)
                                                        callback(err, null);
                                                    else {
                                                        console.log(rowsss);
                                                        callback(null, { ada: true });
                                                    }
                                                });
                                            }
                                        });

                                }
                            });


                    } else {
                        console.log(rows);
                        callback(null, { ada: false });
                    }
                } else {
                    console.log(rows);
                    callback(null, { expired: true });
                }
            }
        });
};