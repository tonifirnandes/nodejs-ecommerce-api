app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getRegency = function(query, callback) {
    db.query('SELECT * from indonesian_regency WHERE provinceId = (' + query.provinceId + ')', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};