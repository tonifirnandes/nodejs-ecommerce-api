app = require('../../../indexApps');
db = app.db;

exports.updateFaqDislike = function(query, callback) {
    db.query("SELECT * from faq WHERE faqId = " + query.faqId,
        function(err, rows, fields) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                var faqDislike = 1 + rows[0].faqDislike;
                var post = {
                    faqDislike: faqDislike
                };
                db.query("UPDATE faq SET ? WHERE faqId = " + query.faqId, post,
                    function(err, rows, fields) {
                        if (err) {
                            callback(err, null);
                            console.log(err);
                        } else {
                            callback(null, rows);
                            console.log(rows);
                        }
                    });
            }
        });
};