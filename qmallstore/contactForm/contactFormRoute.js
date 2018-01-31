var express = require('express');
var router = express.Router();
var contactFormController = require('../contactForm/contactFormController');
var trim = require('trim');

router.post('/addcontactform', function(req, res, next) {
    if (!trim(req.body.contactFormFirstName) ||
        !trim(req.body.contactFormLastName) ||
        !trim(req.body.contactFormMobileNumber) ||
        !trim(req.body.contactFormEmail) ||
        !trim(req.body.contactFormCompanyName) ||
        !trim(req.body.contactFormCompanyAddress) ||
        !trim(req.body.contactFormInquiry) ||
        !trim(req.body.contactFormRequirement)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        contactFormController.addContactForm(req.body, function(err, result) {
            console.log(result);
            if (err) {
                res.status(200).send({ success: false, messages: "Server bermasalah" });
            } else {
                console.log(result);
                res.status(200).send(result);
            }
        });
    }
});

module.exports = router;