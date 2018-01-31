var productInquiryModel = require('../productInquiry/productInquiryModel');
var messages = require('../../../configuration/MESSAGE');

exports.addProductInquiry = function(call, callback) {
    if (call.customerEmail != null && call.customerTelephone != null && call.customerInquiryNotes != null && call.productId != null) {
        productInquiryModel.insertProductInquiry(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                callback(null, { code: 2030, messages: "Anda berhasil menambahkan product inquiry!", data: result });
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}