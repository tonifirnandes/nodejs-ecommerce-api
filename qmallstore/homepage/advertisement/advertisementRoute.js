var express = require('express');
var router = express.Router();
var advertisementController = require('../advertisement/advertisementController');

router.get('/advertisement', function(req, res, next) {
    advertisementController.advertisementList(req.body, function(err, result) {
        console.log(result);
        if (err) {
            res.status(200).send({ success: false, messages: "Server bermasalah" });
        } else {
            console.log(result);
            res.status(200).send({ success: true, messages: "Data advertisement Berhasil di Akses", data: result });
        }
    });
});


module.exports = router;