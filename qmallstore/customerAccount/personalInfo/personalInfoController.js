var personalInfoModel = require('../personalInfo/personalInfoModal');
var messages = require('../../../configuration/MESSAGE');

exports.addPersonalInfo = function(call, callback) {
    if (call.email != null &&
        call.gender != null &&
        call.customerAddress != null &&
        call.village != null &&
        call.district != null &&
        call.regency != null &&
        call.province != null &&
        call.customerAddressZipcode) {
        personalInfoModel.addCustomerPersonalInfo(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                callback(null, { success: true, messages: "Anda berhasil menambah detail info!", data: result });
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}