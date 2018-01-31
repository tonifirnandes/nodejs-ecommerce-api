var express = require('express');
var router = express.Router();
var registerController = require('../register/registerController');
var trim = require('trim');

router.post('/registeremailcustomer', function(req, res, next) {
    if (!trim(req.body.email) ||
        !trim(req.body.password) ||
        !trim(req.body.confirmPassword) ||
        !trim(req.body.phoneNumber) ||
        !trim(req.body.registerUri)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        registerController.registerEmail(req.body, function(err, result) {
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