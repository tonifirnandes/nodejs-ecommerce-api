app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getdistrict = function(query, callback) {
    db.query('SELECT * from indonesian_district WHERE regencyId = (' + query.regencyId + ')', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};