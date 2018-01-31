var loginCustomerModel = require('../login/loginCustomerModel');
var messages = require('../../../configuration/MESSAGE');

exports.loginCustomer = function(call, callback) {
    if (call.email != null && call.customerPassword != null) {
        loginCustomerModel.loginCustomerCheck(call, function(err, resulted) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                if (resulted.nothingEmail) {
                    callback(null, { code: 7001, messages: "TIdak ada email atau phonenumber" })
                } else if (resulted.code === 7000) {
                    callback(null, resulted)
                } else {
                    callback(null, resulted)
                }
            }
        });

    } else {
        callback(null, messages.parameter_not_completed);
    }
}