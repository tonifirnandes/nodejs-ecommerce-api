var express = require('express');
var router = express.Router();
var subscribeController = require('../subcribe/subcribeEmailController');
var trim = require('trim');

router.post('/insertsubcribeemail', function(req, res, next) {
    if (!trim(req.body.email)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        subscribeController.InsertSubscribeEmail(req.body, function(err, result) {
            console.log(result);
            if (err) {
                res.status(200).send({ success: false, messages: "Server bermasalah" });
            } else {
                console.log(result);
                res.status(200).send(result);
            }
        });
    }
});

module.exports = router;