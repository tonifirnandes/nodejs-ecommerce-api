app = require('../../indexApps');
var moment = require('moment');
db = app.db;

exports.insertContactForm = function(query, callback) {
    var post = {
        contactFormFirstName: query.contactFormFirstName,
        contactFormLastName: query.contactFormLastName,
        contactFormMobileNumber: query.contactFormMobileNumber,
        contactFormEmail: query.contactFormEmail,
        contactFormCompanyName: query.contactFormCompanyName,
        contactFormCompanyAddress: query.contactFormCompanyAddress,
        contactFormInquiry: query.contactFormInquiry,
        contactFormRequirement: query.contactFormRequirement
    };
    db.query('INSERT INTO contact_form set ? ', post, function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};