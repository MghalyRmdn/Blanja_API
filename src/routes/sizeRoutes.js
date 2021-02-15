const express = require("express");
const sizeRouter = express.Router();

const sizeController = require("../controllers/Size");

sizeRouter.get("/" , sizeController.getSize);
sizeRouter.get("/:id" , sizeController.getSizeById);
sizeRouter.post("/" , sizeController.postSizes);

module.exports = sizeRouter;