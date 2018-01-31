app = require('../../../indexApps');
var moment = require('moment');
var groupArray = require('group-array');
var math = require('mathjs');
db = app.db;
var date = require('date-and-time');

exports.insertProductInquiry = function(query, callback) {
    var customerInquiryDate = new Date();
    var post = {
        customerEmail: query.customerEmail,
        customerTelephone: query.customerTelephone,
        customerInquiryNotes: query.customerInquiryNotes,
        productId: query.productId,
        customerInquiryDate: customerInquiryDate
    };
    db.query('INSERT INTO customer_inquiry set ? ', post, function(err, rows, fields) {
        if (err) callback(err, null);
        else callback(null, rows);
        console.log(rows);
    });
};