const db = require("../configs/mySQL");

module.exports = {
  getHistory: (id) => {
    return new Promise((resolve, reject) => {
      const queryString =
        'SELECT h.id , h.user_id , h.prd_id , h.invoice , h.qty ,h.price AS total , h.created_at , u.user_name FROM history_transactions AS h JOIN users AS u on u.id  = h.user_id WHERE h.user_id = ?';
      db.query(queryString,id ,(err, results) => {
        if (!err) {
          resolve(results);
        } else if( results === 0){
          res.json({
            msg: 'History Null',
            status: 401,
            results
          })      
        } else {
          reject(err);
        }
      });
    });
  },

  postHistory: (req) => {
    return new Promise((resolve, reject) => {
      const qs = "INSERT INTO history_transactions SET ?";
      db.query(qs, req, (err, data) => {
        if (!err) {
          resolve(data[0]);
        } else {
          reject(err);
        }
      });
    });
  },
};
