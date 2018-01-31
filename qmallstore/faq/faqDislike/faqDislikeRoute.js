var express = require('express');
var router = express.Router();
var faqDislikeController = require('../faqDislike/faqDislikeController');
var trim = require('trim');

router.post('/faqdislike', function(req, res, next) {
    if (!trim(req.body.faqId)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        faqDislikeController.faqDislike(req.body, function(err, result) {
            console.log(result);
            if (err) {
                res.status(200).send({ success: false, messages: "Server bermasalah" });
            } else {
                console.log(result);
                res.status(200).send({ code: 4000, messages: "data berhasil di perbaharui" });
            }
        });
    }
});
module.exports = router;