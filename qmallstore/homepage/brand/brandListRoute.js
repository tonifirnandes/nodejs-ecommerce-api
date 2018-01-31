var express = require('express');
var router = express.Router();
var brandListController = require('../brand/brandListController');

router.get('/brandlist', function(req, res, next) {
    brandListController.brandList(req.body, function(err, result) {
        console.log(result);
        if (err) {
            res.status(200).send({ success: false, messages: "Server bermasalah" });
        } else {
            console.log(result);
            res.status(200).send({ success: true, data: result });
        }
    });
});


module.exports = router;