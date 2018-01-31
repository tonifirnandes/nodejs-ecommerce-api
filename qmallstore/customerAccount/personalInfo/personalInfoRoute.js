var express = require('express');
var router = express.Router();
var personalInfoController = require('../personalInfo/personalInfoController');
var trim = require('trim');

router.post('/addpersonalinfo', function(req, res, next) {
    if (!trim(req.body.email) ||
        !trim(req.body.gender) ||
        !trim(req.body.customerAddress) ||
        !trim(req.body.village) ||
        !trim(req.body.district) ||
        !trim(req.body.regency) ||
        !trim(req.body.province) ||
        !trim(req.body.customerAddressZipcode)) {
        res.status(200).send({ success: false, messages: "parameter tidak lengkap" });
    } else {
        personalInfoController.addPersonalInfo(req.body, function(err, result) {
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