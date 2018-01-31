var express = require('express');
var router = express.Router();
var searchProductController = require('../searchProduct/searchProductController');
var trim = require('trim');

router.get('/searchproduct', function(req, res, next) {
    searchProductController.checkingHeaderSession(req.headers, function(err, result) {
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
        } else {
            if (result.code === 9000) {
                if (!trim(req.query.searchingkey) && !trim(req.query.stocks) && !trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    searchProductController.searchProductListLogin(req.query, function(err, resultProductList) {
                        if (err) {
                            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
                        } else {
                            res.status(200).send(resultProductList);
                        }
                    });
                }
            } else {
                if (!trim(req.query.searchingkey) && !trim(req.query.stocks) && !trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    searchProductController.searchProductListNoLogin(req.query, function(err, resultProductList) {
                        if (err) {
                            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
                        } else {
                            res.status(200).send(resultProductList);
                        }
                    });
                }
            }
        }
    });
});
module.exports = router;