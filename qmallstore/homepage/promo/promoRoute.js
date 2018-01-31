var express = require('express');
var router = express.Router();
var promoController = require('../promo/promoController');

router.get('/promo', function(req, res, next) {
    promoController.promoList(req.body, function(err, result) {
        console.log(result);
        if (err) {
            res.status(200).send({ success: false, messages: "Server bermasalah" });
        } else {
            console.log(result);
            res.status(200).send({ success: true, messages: "Data promo Berhasil di Akses", data: result });
        }
    });
});


module.exports = router;