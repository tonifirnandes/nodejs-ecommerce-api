var express = require('express');
var router = express.Router();
var resendCodeController = require('../resendCode/resendCodeController');
var trim = require('trim');

router.post('/resendcode', function(req, res, next) {
    if (!trim(req.body.emailCode)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        resendCodeController.resendCode(req.body, function(err, result) {
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