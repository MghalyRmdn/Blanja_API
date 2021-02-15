const authRouter = require("express").Router();

const authController = require("../controllers/Auth");
const checkToken = require("../helpers/middlewares/checkToken")

authRouter.delete("/logout", authController.logout);
authRouter.post("/signup", authController.signup);
authRouter.post("/login", authController.login);
authRouter.post("/sendemailuser", authController.sendEmailUser);
authRouter.post("/otp", authController.otpLogin);
authRouter.post("/resetpass/:id", authController.newPassCtrl);
authRouter.patch("/changepass", authController.changePassword);
authRouter.get("/checktoken", checkToken.login, authController.tokenlogin);
module.exports = authRouter;
