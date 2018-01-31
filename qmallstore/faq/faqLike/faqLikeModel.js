app = require('../../../indexApps');
db = app.db;

exports.updateFaqLike = function(query, callback) {
    db.query("SELECT * from faq WHERE faqId = " + query.faqId,
        function(err, rows, fields) {
            if (err) {
                callback(err, null);
                console.log(err);
            } else {
                var faqLike = 1 + rows[0].faqLike;
                var post = {
                    faqLike: faqLike
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