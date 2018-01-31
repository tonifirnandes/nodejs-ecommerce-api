var faqWaitingListModel = require('../faqWaitingList/faqWaitingListModel');
var messages = require('../../../configuration/MESSAGE');

exports.addFaqWaitingList = function(call, callback) {
    if (call.faqWaitingListSubject != null &&
        call.faqWaitingListQuestion != null &&
        call.faqWaitingListDetail != null) {
        faqWaitingListModel.insertFaqWaitingList(call, function(err, result) {
            if (err) {
                callback(err, null);
            } else {
                callback(null, { success: true, messages: "Anda berhasil faq waiting list!" });
            }
        });
    } else {
        callback(null, messages.parameter_not_completed);
    }
}