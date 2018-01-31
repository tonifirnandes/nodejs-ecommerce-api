var express = require('express');
var router = express.Router();
var searchLimitController = require('../searchLimit/limitController');
var trim = require('trim');

router.get('/searchproductlimit', function(req, res, next) {
    if (!req.query.productbrandid || !trim(req.query.searchingkey)) {
        res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
    } else {
        searchLimitController.searchProductByBrandLimitList(req.query, function(err, result) {
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
});

module.exports = router;