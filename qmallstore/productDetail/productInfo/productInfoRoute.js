var express = require('express');
var router = express.Router();
var productInfoController = require('../productInfo/productInfoController');
var trim = require('trim');

router.get('/productinfodetail', function(req, res, next) {
    productInfoController.checkingHeaderSession(req.headers, function(err, resultSession) {
        console.log(resultSession);
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                if (!trim(req.query.productId) || !trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    productInfoController.productInfoLogin(req.query, function(err, result) {
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
                if (!trim(req.query.productId) || !trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    productInfoController.productInfoNoLogin(req.query, function(err, result) {
                        console.log(result);
                        if (err) {
                            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
                            console.log(err);
                        } else {
                            res.status(200).send(result);
                            console.log(result);
                        }
                    });
                }
            }
        }
    });

});

module.exports = router;