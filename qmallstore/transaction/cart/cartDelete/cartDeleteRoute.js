var express = require('express');
var router = express.Router();
var cartDeleteController = require('../cartDelete/cartDeleteController');
var trim = require('trim');

router.post('/cartdelete', function(req, res, next) {
    cartDeleteController.checkingHeaderSession(req.headers, function(err, resultSession) {
        console.log(resultSession);
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                if (!trim(req.body.cartId) || !trim(req.body.productId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    cartDeleteController.deleteCart(req.body, function(err, result) {
                        if (err) {
                            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
                            console.log(err);
                        } else {
                            res.status(200).send({ deleteView: result });
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