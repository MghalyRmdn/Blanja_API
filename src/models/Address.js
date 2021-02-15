const db = require("../configs/mySQL");

// exports.postAddress = (insertBody) => {
//   return new Promise((resolve, reject) => {
//     const qs = "INSERT INTO address SET ?";
//     db.query(qs, insertBody, (err, data) => {
//       if (!err) {
//         resolve(data);
//       } else {
//         reject({
//           status: 500,
//           msg: "Internal Server Error",
//         });
//       }
//     });
//   });
// };
exports.postNewAddress = (insertBody) => {
  return new Promise((resolve, reject) => {
    const queryString = "INSERT INTO address SET ?";
    db.query(queryString, insertBody, (err, data) => {
      if (!err) {
        resolve(data);
      } else {
        console.log(err)
        reject(err);
      }
    });
  });
};

exports.getAddress = (id) => {
  return new Promise((resolve, reject) => {
    const qs =
      'SELECT a.id , a.address ,u.user_name  FROM address AS a JOIN users AS u on a.user_id = u.id  WHERE a.user_id = '+ id + ' ORDER BY created_at DESC';
    db.query(qs, id, (err, data) => {
      if (!err) {
        resolve(data);
      } else {
        console.log(err);
        reject(err);
      }
    });
  });
};

exports.updateModel = (req , id , user_id) => {
  return new Promise((resolve, reject) => {
    const queryStr = `UPDATE address  SET ? WHERE id= ${id}`;
    db.query(queryStr, [req , user_id], (err, data) => {
      if (!err) {
        resolve(data);
      } else {
        console.log(err);
        reject(err);
      }
    });
  });
};

exports.deleteAddressById = (id) => {
  return new Promise((resolve, reject) => {
    const queryStr = `DELETE FROM address WHERE id = ${id}`;
    db.query(queryStr, id, (err, data) => {
      if (!err) {
        resolve(data);
      } else {
        reject(err);
      }
    });
  });
};
