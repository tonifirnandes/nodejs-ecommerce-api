var express = require('express');
var router = express.Router();
var checkOtpController = require('../checkOtp/checkOtpController');
var trim = require('trim');

router.post('/checkotpcode', function(req, res, next) {
    if (!trim(req.body.emailCode) || !trim(req.body.otpCode)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        checkOtpController.checkOtp(req.body, function(err, result) {
            console.log(result);
            if (err) {
                res.status(200).send({ success: false, messages: "Server bermasalah" });
                console.log(err);
            } else {
                console.log(result);
                res.status(200).send(result);
            }
        });
    }
});
module.exports = router;