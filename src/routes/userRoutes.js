const userRouter = require("express").Router();

const userController = require("../controllers/User");
const checktoken = require("../helpers/middlewares/checkToken");
const upload = require("../helpers/middlewares/upload");
const uploadImage = require("../helpers/middlewares/imgUpload");

userRouter.get("/:id", userController.getUser);
userRouter.patch("/info/:id" , uploadImage.multiUpload ,checktoken.login  , userController.updateProfile);
userRouter.patch("/photo/:id", upload,userController.changePhoto );
module.exports = userRouter;
