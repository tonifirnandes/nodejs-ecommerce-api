var contactFormModel = require('../contactForm/contactFormModel');
var messages = require('../../configuration/MESSAGE');

exports.addContactForm = function(call, callback) {
    if (call.contactFormFirstName != null &&
        call.contactFormLastName != null &&
        call.contactFormMobileNumber != null &&
        call.contactFormEmail != null &&
        call.contactFormCompanyName != null &&
        call.contactFormCompanyAddress != null &&
        call.contactFormInquiry != null &&
        call.contactFormRequirement) {
        contactFormModel.insertContactForm(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                callback(null, { success: true, messages: "Anda berhasil contact form!", data: result });
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}