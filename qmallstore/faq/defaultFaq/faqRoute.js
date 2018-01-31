var express = require('express');
var router = express.Router();
var faqController = require('../defaultFaq/faqController');

router.get('/faq', function(req, res, next) {
    faqController.faqList(req.body, function(err, result) {
        console.log(result);
        if (err) {
            res.status(200).send({ success: false, messages: "Server bermasalah" });
        } else {
            console.log(result);
            res.status(200).send({ success: true, messages: "Data FAQ Berhasil di Akses", data: result });
        }
    });
});


module.exports = router;