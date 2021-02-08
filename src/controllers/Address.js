const addressModel = require("../models/Address");
const form = require("../helpers/form");

module.exports = {
  // postNewAddress: (req, res) => {
  //   const { body } = req;
  //   const insertBody = {
  //     ...body,
  //     id:user_id,
  //   };
  //   addressModel
  //     .postAddress(insertBody)
  //     .then((data) => {
  //       console.log(data);
  //       res.json({
  //         msg: "address berhasil ditambahakan",
  //         data,
  //       });
  //     })
  //     .catch((err) => {
  //       form.error(res, err);
  //     });
  // },
  postNewAddress: (req, res) => {
    const { body } = req;
    addressModel
      .postNewAddress(body)
      .then((data) => {
        const resObj = {
          id: data.insertId,
          ...body,
        }  
        form.success(res , resObj);
      })
      .catch((err) => {
        form.error(res, err);
      });
  },

  getAddress: (req, res) => {
    const { id } = req.params;
    addressModel
      .getAddress(id)
      .then((data) => {
        console.log(data);
        res.json({
          data,
        });
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
  updateAddress : (req , res ) => {
    const { body } = req;
    const { id } = req.params;
    let updateByID = Object.values(body);
    updateByID.push(id);
    addressModel.updateModel(req)
    .then(() => {
      form.success(res , {
        msg: 'Address Updated',
        data: {...body},
      })
    })
    .catch(err => {
      form.error(res , err);
    })
  }
};
