var express = require('express');
var router = express.Router();
var topSellingController = require('../bySelling/topSellingController');
var trim = require('trim');

router.get('/topselling', function(req, res, next) {
    topSellingController.checkingHeaderSession(req.headers, function(err, result) {
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
        } else {
            if (result.code === 9000) {
                if (!trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    topSellingController.topSellingListLogin(req.query, function(err, result) {
                        console.log(result);
                        if (err) {
                            res.status(200).send({ code: 2020, messages: "Server bermasalah" });
                        } else {
                            console.log(result);
                            res.status(200).send({ code: 2021, messages: "Data Top Selling Berhasil di Akses", data: result });
                        }
                    });
                }
            } else {
                if (!trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    topSellingController.topSellingListNoLogin(req.query, function(err, result) {
                        console.log(result);
                        if (err) {
                            res.status(200).send({ code: 2020, messages: "Server bermasalah" });
                        } else {
                            console.log(result);
                            res.status(200).send({ code: 2021, messages: "Data Top Selling Berhasil di Akses", data: result });
                        }
                    });
                }
            }
        }
    });
});
module.exports = router;