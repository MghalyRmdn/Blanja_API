require("dotenv").config();
const express = require("express");
// const mysql = require("mysql");
const logger = require("morgan");
const cors = require("cors");
const app = express();
const port = process.env.PORT;
const http = require("http");
const socketio = require("socket.io");
const server = http.createServer(app)
const mainRouter = require("./src/routes/index");
const io = socketio(server).sockets


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

io.on("connection" , (socket) => {
    const id = socket.handshake.query.user_id;
    console.log("a user connected ...",id,socket.id);
    socket.join(id);
    socket.on("chat message", (msg , id_recipient) => {
        console.log(msg.sender);
        console.log(id.id_recipient);
        console.log(id);
        console.log(msg);
        io.to(id_recipient).to(id).emit("chat message" , msg);
    })
})

server.listen(port , () => console.log(`server running on port: ${port}`))

module.exports = app;
