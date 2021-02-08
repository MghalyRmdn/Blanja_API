const categoryRouter = require("express").Router();

const categoryController = require("../controllers/Category");

categoryRouter.get("/", categoryController.getCategory);

module.exports = categoryRouter;
