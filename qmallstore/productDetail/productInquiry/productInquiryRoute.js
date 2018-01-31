var express = require('express');
var router = express.Router();
var productInquiryController = require('../productInquiry/productInquiryController');
var trim = require('trim');

router.post('/addproductinquiry', function(req, res, next) {
    if (!trim(req.body.customerEmail) ||
        !trim(req.body.customerTelephone) ||
        !trim(req.body.customerInquiryNotes) ||
        !trim(req.body.productId)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        productInquiryController.addProductInquiry(req.body, function(err, result) {
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