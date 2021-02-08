const historyModel = require("../models/History");
const form = require("../helpers/form");

function generateOTP() {
  // Declare a string variable
  // which stores all string
  var string = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
  let OTP = "";

  // Find the length of string
  var len = string.length;
  for (let i = 0; i < 10; i++) {
    OTP += string[Math.floor(Math.random() * len)];
  }
  return OTP;
}

module.exports = {
  getHistory: (req, res) => {
    const { id } = req.params;
    historyModel
      .getHistory(id)
      .then((results) => {
        res.json(results);
      })
      .catch((err) => {
        res.json(err);
      });
  },

  postHistory: (req, res) => {
    const { body } = req;
    const id = body.user_id;
    const year = new Date().getFullYear();
    const randomChar = generateOTP();
    const insertBody = {
      ...body,
      invoice: `INV/${year}/${id}/${randomChar}`,
      created_at: new Date(Date.now()),
      status: 'Menunggu Pembayaran'
    };
    console.log(insertBody);
    historyModel
      .postHistory(insertBody, res)
      .then((data) => {
        res.json({
          msg: "transaction success",
          data,
        })
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
};
