var express = require('express');
var router = express.Router();
var faqWaitingListController = require('../faqWaitingList/faqWaitingListController');
var trim = require('trim');

router.post('/addfaqwaitinglist', function(req, res, next) {
    if (!trim(req.body.faqWaitingListSubject) ||
        !trim(req.body.faqWaitingListQuestion) ||
        !trim(req.body.faqWaitingListDetail)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        faqWaitingListController.addFaqWaitingList(req.body, function(err, result) {
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