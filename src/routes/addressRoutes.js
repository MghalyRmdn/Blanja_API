const addressRouter = require("express").Router();

const addressController = require("../controllers/Address");

const checkToken = require("../helpers/middlewares/checkToken");

// addressRouter.post("/",checkToken.login ,checkToken.seller,addressController.postNewAddress);
addressRouter.post("/",checkToken.login ,checkToken.seller,addressController.postNewAddress);
addressRouter.get("/:id", checkToken.login , checkToken.seller, addressController.getAddress);

module.exports = addressRouter;
