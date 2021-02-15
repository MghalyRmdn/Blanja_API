require("dotenv").config();
const express = require("express");
// const mysql = require("mysql");
const logger = require("morgan");
const cors = require("cors");
const app = express();
const port = process.env.PORT;
const http = require("http");
const socketio = require("socket.io");
const server = http.createServer(app);
const mainRouter = require("./src/routes/index");
const io = socketio(server).sockets;

// logger
app.use(logger("dev"));

// memperbolehkan access dari semua origin
app.use(cors());

//cors

app.use(express.static("public"));

// menambahkan parser untuk x-www-form-urlencoded
app.use(express.urlencoded({ extended: false }));
// extended: false => menggunakan qs
// extended: true => menggunakan querystring

// menambahkan parser untuk raw json
app.use(express.json());

// Routes
app.use("/", mainRouter);

global.io = io;
io.on("connection", (socket) => {
  const id = socket.handshake.query.user_id;
  console.log("a user connected ...", id, socket.id);
  socket.join(id);
  socket.on("chat message", (msg, id_recipient, room_id) => {
    console.log(msg);
    console.log(id_recipient);
    io.to(id_recipient).to(id).emit(room_id, msg);
  });

  socket.on("sending", (customer_id) => {
    io.to(customer_id).emit(
      "sending customer",
      "Your product is must be shipping now"
    );
    io.to(id).emit("sending seller", "Product status is Shipping now");
  });

  socket.on("received", (seller_id) => {
    io.to(seller_id).emit(
      "received seller",
      "Customer has received the product"
    );
    io.to(id).emit("received customer", "Product status is delivered now");
  });
});

server.listen(port, () => console.log(`server running on port: ${port}`));

module.exports = app;
