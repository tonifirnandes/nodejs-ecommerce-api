var express = require('express');
var router = express.Router();
var newsletterController = require('../newsletter/newsletterController');

router.get('/newsletter', function(req, res, next) {
    newsletterController.newsletterList(req.body, function(err, result) {
        console.log(result);
        if (err) {
            res.status(200).send({ success: false, messages: "Server bermasalah" });
        } else {
            console.log(result);
            res.status(200).send({ success: true, messages: "Data Product Berhasil di Akses", data: result });
        }
    });
});


module.exports = router;