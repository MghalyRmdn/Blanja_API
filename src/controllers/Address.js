const addressModel = require("../models/Address");
const form = require("../helpers/form");

module.exports = {
  postNewAddress: (req, res) => {
    const { body } = req;
    const { id } = req.params;
    const insertBody = { ...body, user_id: id };
    addressModel
      .postNewAddress(insertBody)
      .then((data) => {
        console.log(data);
        const newResObj = {
          id: data.insertid,
          ...insertBody,
        };
        form.success(res, newResObj);
      })
      .catch((err) => {
        form.error(res, err);
      });
  },

  getAddress: (req, res) => {
    const  {id}  = req.params;
    addressModel
      .getAddress(id)
      .then((data) => {
        if(data.length === 0){
          res.status(404).json({
            msg: "Address Not found",
          });
        } else {
          console.log(data);
          form.success(res, data);
        }
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
  updateAddress: (req, res) => {
    const { body } = req;
    const { id } = req.params;
    const user_id = req.decodeToken.id;
    const insertBody = { ...body };
    addressModel
      .updateModel(insertBody, id, res, user_id)
      .then((data) => {
        if (data.affectedRows === 0) {
          res.status(404).json({
            msg: "Data Not Found",
          });
        } else {
          const newResObj = {
            id: user_id,
            ...insertBody,
            msg: 'Data Adrress Updated'
          };
          form.success(res, newResObj);
        }
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
  deleteAddressById: (req, res) => {
    const { id } = req.params;
    addressModel
      .deleteAddressById(id)
      .then((data) => {
        form.success(res, data);
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
};
