var express = require('express');
var router = express.Router();
var searchByPartNumberController = require('../searchByPartNumber/searchByPartNumberController');
var trim = require('trim');

router.get('/searchproductbypartnumber', function(req, res, next) {
    if (!trim(req.query.searchingkey)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        searchByPartNumberController.searchProductByPartNumberList(req.query, function(err, result) {
            console.log(result);
            if (err) {
                res.status(200).send({ success: false, messages: "Server bermasalah" });
                console.log(err);
            } else {
                res.status(200).send(result);
                console.log(result);
            }
        });
    }
});

module.exports = router;