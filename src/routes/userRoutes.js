const userRouter = require("express").Router();

const userController = require("../controllers/User");

userRouter.get("/:id", userController.getUser);

module.exports = userRouter;
