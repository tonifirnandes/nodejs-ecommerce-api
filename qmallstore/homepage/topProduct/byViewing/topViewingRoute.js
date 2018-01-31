var express = require('express');
var router = express.Router();
var topViewingController = require('../byViewing/topViewingController');
var trim = require('trim');

router.get('/topviewing', function(req, res, next) {
    topViewingController.checkingHeaderSession(req.headers, function(err, result) {
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
        } else {
            if (result.code === 9000) {
                if (!trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    topViewingController.topViewingListLogin(req.query, function(err, result) {
                        console.log(result);
                        if (err) {
                            res.status(200).send({ code: 2020, messages: "Server bermasalah" });
                        } else {
                            console.log(result);
                            res.status(200).send({ code: 2021, messages: "Data Top Viewing Berhasil di Akses", data: result });
                        }
                    });
                }
            } else {
                if (!trim(req.query.productBrandId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    topViewingController.topViewingListNoLogin(req.query, function(err, result) {
                        console.log(result);
                        if (err) {
                            res.status(200).send({ code: 2020, messages: "Server bermasalah" });
                        } else {
                            console.log(result);
                            res.status(200).send({ code: 2021, messages: "Data Top Viewing Berhasil di Akses", data: result });
                        }
                    });
                }
            }
        }
    });
});
module.exports = router;