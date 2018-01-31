var express = require('express');
var router = express.Router();
var loginCustomerController = require('../login/loginCustomerController');
var trim = require('trim');

router.post('/logincustomer', function(req, res, next) {
    if (!trim(req.body.email) || !trim(req.body.customerPassword)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        loginCustomerController.loginCustomer(req.body, function(err, result) {
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