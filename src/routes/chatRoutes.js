const chatRouter = require("express").Router();

const chatController = require("../controllers/Chat");

chatRouter.get("/seller/:id", chatController.getRoomSeller);
chatRouter.get("/customer/:id", chatController.getRoomCustomer);
chatRouter.post("/", chatController.postChat);
chatRouter.get("/:id", chatController.getChatByRoomId);
chatRouter.post("/room", chatController.postRoomChat);

module.exports = chatRouter;
