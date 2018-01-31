var express = require('express');
var router = express.Router();
var resetPasswordController = require('../resetPassword/resetPasswordController');
var trim = require('trim');

router.post('/resetpassword', function(req, res, next) {
    if (!trim(req.body.password) || !trim(req.body.confirmPassword) || !trim(req.body.customerForgotPasswordCode)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        if (req.body.password === req.body.confirmPassword) {
            resetPasswordController.resetPassword(req.body, function(err, result) {
                console.log(result);
                if (err) {
                    res.status(200).send({ success: false, messages: "Server bermasalah" });
                } else {
                    console.log(result);
                    res.status(200).send(result);
                }
            });
        } else {
            res.status(200).send({ code: 8004, messages: "password tidak cocok" });
        }
    }
});

module.exports = router;