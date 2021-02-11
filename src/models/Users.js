const { query } = require("../configs/mySQL");
const db = require("../configs/mySQL");

exports.getUser = (id) => {
  return new Promise((resolve, reject) => {
    const qs =
      "SELECT id, email, birth_date ,user_name, photo_user , phone_num  FROM users WHERE id = ?";
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

exports.updateProfile = (body, id) => {
  return new Promise((resolve, reject) => {
    const queryStr = `UPDATE users SET ? WHERE id=?`;
    db.query(queryStr, [body, id], (err, data) => {
      if (!err) {
        resolve({
          status: 200,
          message: "Data berhsail update",
          data: body,
        });
      } else {
        reject({
          status: 500,
          message: err,
        });
      }
    });
  });
};

exports.getOldPhoto = (id) => {
  return new Promise((resolve, reject) => {
    const queryStr = `SELECT photo_user FROM users WHERE id=?`;
    db.query(queryStr, id, (err, data) => {
      if (!err) {
        if (data.length > 0) {
          resolve({
            status: 200,
            image: data[0].photo_user,
          });
        } else {
          reject({
            status: 500,
            message: "Internal Server error",
            detail: err,
          });
        }
      }
    });
  });
};

exports.changePhoto = (image, id) => {
  return new Promise((resolve, reject) => { 
    const queryStr = `UPDATE users SET photo_user = ? WHERE id = ?`;
    db.query(queryStr, [image, id], (err, data) => {
      if (!err) {
        resolve({
          status: 200,
          message: "Foto Profil Diubah",
          data
        });
      } else {
        reject({
          status: 500,
          message: "internal server error",
          detail: err,
        });
      }
    });
  });
};
