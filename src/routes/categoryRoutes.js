const categoryRouter = require("express").Router();

const categoryController = require("../controllers/Category");

categoryRouter.get("/", categoryController.getCategory);
categoryRouter.get("/brand" , categoryController.getBrand);

module.exports = categoryRouter;
