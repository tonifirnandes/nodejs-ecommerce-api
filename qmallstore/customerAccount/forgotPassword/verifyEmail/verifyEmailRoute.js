var express = require('express');
var router = express.Router();
var emailCheckForgotPasswordController = require('../verifyEmail/verifyEmailController');
var trim = require('trim');

router.post('/emailcheckforgotpassword', function(req, res, next) {
    if (!trim(req.body.email) || !trim(req.body.forgetPasswordUri)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        emailCheckForgotPasswordController.emailCheckForgotPassword(req.body, function(err, result) {
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