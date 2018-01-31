app = require('../../../indexApps');
var moment = require('moment');
db = app.db;

exports.getVIllage = function(query, callback) {
    db.query('SELECT * from indonesian_village WHERE districtId = (' + query.districtId + ')', function(err, rows, fields) {
        if (err)
            callback(err, null);
        else
            callback(null, rows);
        console.log(rows);
    });
};