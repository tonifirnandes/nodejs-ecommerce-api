var express = require('express');
var router = express.Router();
var cartShowController = require('../cartShow/cartShowController');
var trim = require('trim');

router.post('/cartshowall', function(req, res, next) {
    cartShowController.checkingHeaderSession(req.headers, function(err, resultSession) {
        console.log(resultSession);
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                if (!trim(req.body.customerEmail)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    cartShowController.showCart(req.body, function(err, result) {
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