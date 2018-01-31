var express = require('express');
var router = express.Router();
var orderProductController = require('../orderProduct/orderProductController');
var trim = require('trim');

router.post('/orderproduct', function(req, res, next) {
    orderProductController.checkingHeaderSession(req.headers, function(err, resultSession) {
        console.log(resultSession);
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                if (!trim(req.body.cartId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    orderProductController.checkingPriceController(req.body, function(err, result) {
                        if (err) {
                            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
                            console.log(err);
                        } else {
                            res.status(200).send({ session: resultSession, cartView: result });
                            console.log(result);
                        }
                    });
                }
            } else {
                res.status(200).send({ session: resultSession });
            }
        }
    });
});

module.exports = router;