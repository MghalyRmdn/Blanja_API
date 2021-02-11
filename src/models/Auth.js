const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const db = require("../configs/mySQL");

function saveOtp(otp) {
  db.query("INSERT INTO tb_otp SET otp=?", otp);
}

module.exports ={
  postNewUser : (body) => {
    //gensalt
    //hash
    //store DB
    return new Promise((resolve, reject) => {
      const saltRounds = 10;
      bcrypt.genSalt(saltRounds, (err, salt) => {
        if (err) {
          reject(err);
        }
        bcrypt.hash(body.user_password, salt, (err, hashedPassword) => {
          if (err) {
            reject(err);
          }
          const newBody = {
            ...body,
            user_password: hashedPassword,
          };
          const qs = "INSERT INTO users SET ?";
          db.query(qs, newBody, (err, data) => {
            if (!err) {
              resolve(data);
            } else {
              reject(err);
            }
          });
        });
      });
    });
  },
  postLogin : (body) => {
    // query ke DB => SELECT password WHERE username == username body
    // compare body password dengan password DB
    // jwt => sign, verify
    // sign => mendapatkan token dari payload
    // token dikirim ke client
    return new Promise((resolve, reject) => {
      if (body.email == 0 || body.user_password == 0) {
        return reject({
          msg: "input user",
        });
      }
      const { email, user_password } = body;
      const qs =
        "SELECT users.user_password,users.email, levels.level, users.id , users.user_name , users.photo_user , users.phone_num ,users.birth_date FROM users JOIN levels ON levels.id = users.level_id WHERE email=?";
      db.query(qs, email, (err, data) => {
        if (err) {
          reject({
            msg: "Error SQL",
            status: 500,
            err,
          });
        }
        console.log(data);
        if (data == undefined) {
          return reject({
            msg: "error",
          });
        }
        if (!data[0]) {
          reject({
            msg: "User Not Found",
            status: 404,
          });
        } else {
          bcrypt.compare(user_password, data[0].user_password, (err, result) => {
            if (err) {
              reject({
                msg: "Hash Error",
                status: 500,
                err,
              });
            }
            // result => true : false
            if (!result) {
              reject({
                msg: "Wrong Password",
                status: 401,
              });
            } else {
              const payload = {
                email,
                level: data[0].level,
              };
              const secret = process.env.SECRET_KEY;
              const token = jwt.sign(payload, secret);
              resolve({
                token,
                user_id: data[0].id,
                level: data[0].level,
                user_name: data[0].user_name,
                photo_user: data[0].photo_user,
                email: data[0].email,
                phone: data[0].phone_num,
                birth_date: data[0].birth_date,
              });
            }
          });
        }
      });
    });
  },
  postLogout : (whitelisttoken) => {
    return new Promise((resolve, reject) => {
      const qs = "DELETE FROM token_whitelist WHERE token=?";
      db.query(qs, whitelisttoken, (err, data) => {
        if (data.affectedRows === 0) {
          reject({
            status: 404,
            msg: "token tidak ditemukan, login gagal",
          });
        }
        if (!err) {
          resolve({
            msg: `Logout berhasil`,
          });
        } else {
          reject({
            msg: `Logout tidak berhasil`,
          });
        }
      });
    });
  },
  sendEmailUser : (body) => {
    return new Promise((resolve, reject) => {
      const queryStr = "SELECT id, email FROM users WHERE email = ?";
      db.query(queryStr, [body.email], (err, data) => {
        if (err) {
          reject(err);
        }
        console.log(data.email);
        if (data.length !== 0) {
          console.log(data[0]);
          function generateOTP() {
            var string =
              "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
            let OTP = "";
            var len = string.length;
            for (let i = 0; i < 6; i++) {
              OTP += string[Math.floor(Math.random() * len)];
            }
            return OTP;
          }
          let otp = generateOTP();
          console.log(otp);
          //localStorage.setItem("userId", data[0].id_user);
          saveOtp(otp);
  
          // let link = `${process.env.REACT_APP_URL}/Confirmation-password?id_user=${data[0].id_user}`
          resolve({
            email: data[0].email,
            otp: otp,
            userId: data[0].id,
          });
        } else {
          reject({
            msg: "data not found",
          });
        }
      });
    });
  },
  postOtp : (body) => {
    // query ke DB => SELECT password WHERE username == username body
    // compare body password dengan password DB
    // jwt => sign, verify
    // sign => mendapatkan token dari payload
    // token dikirim ke client
    return new Promise((resolve, reject) => {
      if (body.otp == 0) {
        return reject({
          msg: "input otp",
        });
      }
      const { otp } = body;
      const qs = "SELECT otp FROM tb_otp WHERE otp = ?";
      db.query(qs, otp, (err, data) => {
        console.log(qs);
        if (err) {
          reject({
            msg: "Error SQL",
            status: 500,
            err,
          });
        }
        console.log(data);
        if (data == undefined) {
          return reject({
            msg: "error",
          });
        }
        if (!data[0]) {
          reject({
            msg: "OTP Not Found",
            status: 404,
          });
        } else {
          resolve(data);
        }
      });
    });
  },
  postNewPass : (id, body) => {
    //gensalt
    //hash
    //store DB
    return new Promise((resolve, reject) => {
      const saltRounds = 10;
      bcrypt.genSalt(saltRounds, (err, salt) => {
        if (err) {
          reject(err);
        }
        bcrypt.hash(body.user_password, salt, (err, hashedPassword) => {
          if (err) {
            reject(err);
          }
          const setUpdate = `user_password = '${hashedPassword}'`;
          const qs = "UPDATE users SET " + setUpdate + " WHERE id = ?";
          db.query(qs, id, (err, data) => {
            console.log(qs);
            if (!err) {
              resolve(data);
            } else {
              reject(err);
            }
          });
        });
      });
    });
  },
  userChangePassword : (body) => {
    return new Promise((resolve, reject) => {
      const { email, old_password, new_password } = body;
      const queryStr = 'SELECT user_password FROM users WHERE email = ?';
      db.query(queryStr, email, (err, data) => {
        if (!err) {
          if (data.length > 0) {
            bcrypt.compare(old_password, data[0].user_password, (error, result) => {
              if (error) {
                reject({
                  status: 500,
                  message: error,
                });
              }
              if (!result) {
                reject({
                  status: 401,
                  message: "Password salah",
                });
              } else {
                const saltRounds = Math.floor(Math.random() * 10) + 1;
                bcrypt.hash(
                  new_password,
                  saltRounds,
                  (errorHash, hashedPassword) => {
                    if (errorHash) {
                      reject({
                        statu: 500,
                        message: errorHash,
                      });
                    } else {
                      const updatePassword = `UPDATE users SET user_password = ? WHERE email = ?`;
                      db.query(
                        updatePassword,
                        [hashedPassword, email],
                        (errorUpdate, dataUpdate) => {
                          if (!errorUpdate) {
                            resolve({
                              status: 200,
                              message: `Change Password , berhasil`,
                            });
                          } else {
                            reject({
                              status: 500,
                              message: errorUpdate,
                            });
                          }
                        }
                      );
                    }
                  }
                );
              }
            });
          } else {
            reject({
              status: 404,
              message: `data tidak ditemukan`,
            });
          }
        }else {
          reject({
            status: 500,
            message: err,
          });
        }
      });
    });
  },
}






