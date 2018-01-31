app = require('../../indexApps');
var moment = require('moment');
db = app.db;

exports.insertSubscribeEmail = function(query, callback) {
    var post = { email: query.email };
    db.query('INSERT INTO newsletter_subcribe set ? ', post, function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};
exports.emailCheck = function(query, callback) {
    db.query("SELECT * from newsletter_subcribe WHERE email = " +
        "'" + query.email + "'",
        function(err, rows, fields) {
            if (err)
                callback(err, null);
            else {
                if (rows[0]) {
                    console.log(rows);
                    callback(null, { ada: true });
                } else {
                    console.log(rows);
                    callback(null, { ada: false });
                }
            }
        });
};