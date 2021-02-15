const express = require("express");
const historyRouter = express.Router();

const historyCtrl = require("../controllers/History");
const checkToken = require("../helpers/middlewares/checkToken");

historyRouter.get(
  "/:id",
  checkToken.login,
  checkToken.seller,
  historyCtrl.getHistory
);
historyRouter.get("/seller/:id", historyCtrl.getHistoryBySellerId);
historyRouter.post("/", historyCtrl.postHistory);
historyRouter.patch("/", historyCtrl.updateStatus);

module.exports = historyRouter;
