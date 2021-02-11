const addressRouter = require("express").Router();

const addressController = require("../controllers/Address");

const checkToken = require("../helpers/middlewares/checkToken");

// addressRouter.post("/",checkToken.login ,checkToken.seller,addressController.postNewAddress);
addressRouter.get("/:id", addressController.getAddress);
addressRouter.post("/:id" ,addressController.postNewAddress);
addressRouter.patch("/:id" , checkToken.login , checkToken.seller,   addressController.updateAddress);
addressRouter.delete("/:id" ,  addressController.deleteAddressById)

module.exports = addressRouter;
