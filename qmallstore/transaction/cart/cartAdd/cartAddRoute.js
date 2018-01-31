var express = require('express');
var router = express.Router();
var cartAddController = require('../cartAdd/cartAddController');
var trim = require('trim');

router.post('/cartadd', function(req, res, next) {
    cartAddController.checkingHeaderSession(req.headers, function(err, resultSession) {
        console.log(resultSession);
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                if (!trim(req.body.customerEmail) ||
                    !trim(req.body.cartItemQuantity) ||
                    !trim(req.body.productPrice) ||
                    !trim(req.body.productId) ||
                    !trim(req.body.cartItemProductPriceType) ||
                    !trim(req.body.cartItemProductPriceStatus)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    cartAddController.addCartCustomer(req.body, function(err, result) {
                        console.log(result);
                        if (err) {
                            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
                            console.log(err);
                        } else {
                            res.status(200).send({ session: resultSession, productView: result });
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