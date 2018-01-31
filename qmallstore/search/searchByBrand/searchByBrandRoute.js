var express = require('express');
var router = express.Router();
var searchByBrandController = require('../searchByBrand/searchByBrandController');
var trim = require('trim');

router.get('/searchproductbybrand', function(req, res, next) {
    searchByBrandController.checkingHeaderSession(req.headers, function(err, result) {
        console.log(result);
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
            console.log(err);
        } else {
            if (result.code === 9000) {
                if (!req.query.brandFilter && !trim(req.query.searchingkey) && !trim(req.query.stocks) && !trim(req.query.categoryFilter) && !trim(req.query.sortingOption) && !trim(req.query.deliveryTimeFilter)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    searchByBrandController.searchProductListLogin(req.query, function(err, result) {
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
            } else {
                if (!req.query.brandFilter && !trim(req.query.searchingkey) && !trim(req.query.stocks) && !trim(req.query.categoryFilter) && !trim(req.query.sortingOption) && !trim(req.query.deliveryTimeFilter)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    searchByBrandController.searchProductByBrandListNoLogin(req.query, function(err, result) {
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