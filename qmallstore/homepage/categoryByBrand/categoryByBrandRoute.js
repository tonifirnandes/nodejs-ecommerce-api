var express = require('express');
var router = express.Router();
var categoryByBrandController = require('../categoryByBrand/categoryByBrandController');
var trim = require('trim');

router.post('/categorybybrand', function(req, res, next) {
    if (!trim(req.body.brandId)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        categoryByBrandController.categoryByBrandList(req.body, function(err, result) {
            console.log(result);
            if (err) {
                res.status(200).send({ success: false, messages: "Server bermasalah" });
            } else {
                console.log(result);
                res.status(200).send({ success: true, messages: "Data Product Berhasil di Akses", data: result });
            }
        });
    }
});


module.exports = router;