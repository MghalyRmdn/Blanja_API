const categoryModel = require("../models/Category");
const form = require("../helpers/form");

module.exports = {
  getCategory: (req, res) => {
    categoryModel
      .getCategory()
      .then((data) => {
        console.log(data);
        res.json({
          data,
        });
      })
      .catch((err) => {
        console.log(err);
        form.error(res, err);
      });
  },
  getBrand: (_,res)=> {
    categoryModel.getBrand()
    .then(data => {
      res.json({
        data,
      })
    })
    .catch(err => {
      console.log(err);
      form.error(res, err);
    })
  }
};
