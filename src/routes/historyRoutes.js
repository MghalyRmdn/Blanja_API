const express = require("express");
const historyRouter = express.Router();

const historyCtrl = require("../controllers/History");
const checkToken = require("../helpers/middlewares/checkToken");

historyRouter.get("/:id", checkToken.login , checkToken.seller,historyCtrl.getHistory);
historyRouter.post("/", historyCtrl.postHistory);

module.exports = historyRouter;
