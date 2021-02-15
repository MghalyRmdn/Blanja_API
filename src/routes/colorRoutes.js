const express = require("express");
const colorRouter = express.Router();

const colorController = require("../controllers/Color");

colorRouter.get("/" , colorController.getColor);
colorRouter.get("/:id" , colorController.getColorById);
colorRouter.post("/" , colorController.postColors);

module.exports = colorRouter;