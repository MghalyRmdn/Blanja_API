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
exports.postNewAddress = (body) => {
  return new Promise((resolve, reject) => {
    const queryString = "INSERT INTO address SET ?";
    db.query(queryString, body, (err, data) => {
      if (!err) {
        resolve(data);
      } else {
        reject(err);
      }
    });
  });
};

exports.getAddress = (id) => {
  return new Promise((resolve, reject) => {
    const qs =
      "SELECT a.id as id_address, a.address, u.user_name ,a.fullname ,a.city , a.province , a.postal_code , a.country FROM address AS a JOIN users AS u on a.user_id = u.id WHERE a.user_id = ?";
    db.query(qs, id, (err, data) => {
      if (!err) {
        resolve(data);
      } else {
        reject({
          status: 500,
          msg: "Internal Server Error",
        });
      }
    });
  });
};

exports.updateModel = (req) => {
  const { body } = req;
  const { id } = req.params;
  let updateAddressById = Object.values(body);
  updateAddressById.push(id);
  return new Promise((resolve, reject) => {
    const queryStr = `UPDATE address AS addr JOIN users AS user ON addr.id = user.id SET ? WHERE user_id= ? `;
    db.query(queryStr, updateAddressById, (err, data) => {
      if (!err) {
        resolve(data);
      } else {
        reject(err);
      }
    });
  });
};

deleteAddressById: req => {
  const { id } = req.params;
  return new Promise((resolve , reject) => {
    const queryStr = `DELETE FROM address WHERE id = ?`
  })
}