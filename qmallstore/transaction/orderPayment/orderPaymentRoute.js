var express = require('express');
var router = express.Router();
var orderPaymentController = require('../orderPayment/orderPaymentController');
var trim = require('trim');

router.post('/orderpayment', function(req, res, next) {
    orderPaymentController.checkingHeaderSession(req.headers, function(err, resultSession) {
        console.log(resultSession);
        if (err) {
            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
            console.log(err);
        } else {
            if (resultSession.code === 9000) {
                if (!trim(req.body.orderId) || !trim(req.body.paymentReferenceId)) {
                    res.status(200).send({ code: 6002, messages: "parameter tidak lengkap" });
                } else {
                    orderPaymentController.addOrderPaymentDetail(req.body, function(err, result) {
                        if (err) {
                            res.status(200).send({ code: 6003, messages: "Product Belum Tersedia" });
                        } else {
                            res.status(200).send({ session: resultSession, orderPayment: result });
                        }
                    });
                }
            } else {
                res.status(200).send({ session: resultSession });
            }
        }
    });
});
module.exports = router;