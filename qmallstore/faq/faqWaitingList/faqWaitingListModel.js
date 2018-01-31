app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.insertFaqWaitingList = function(query, callback) {
    var post = {
        faqWaitingListSubject: query.faqWaitingListSubject,
        faqWaitingListQuestion: query.faqWaitingListQuestion,
        faqWaitingListDetail: query.faqWaitingListDetail
    };
    db.query('INSERT INTO faq_waiting_list set ? ', post, function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};