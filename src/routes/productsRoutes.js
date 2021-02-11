const productsRouter = require("express").Router();

const productsCtrl = require("../controllers/Products");

const checkToken = require("../helpers/middlewares/checkToken");

const multiUpload = require("../helpers/middlewares/multiUpload");

productsRouter.get("/", productsCtrl.getAllProducts);
productsRouter.get("/viewAll" , productsCtrl.viewAllProduct);
productsRouter.post(
  "/",
  multiUpload,
  checkToken.login,
  checkToken.customer,
  productsCtrl.postNewProductCtrl
);

module.exports = productsRouter;
