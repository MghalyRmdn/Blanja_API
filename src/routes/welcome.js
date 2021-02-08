const express = require("express");

const welcomeRouter = express.Router();
// localhost:8000/products
// endpoint => /products
// localhost:8000/
// endpoint => /

// membuat handler untuk endpoint /
welcomeRouter.get("/", (req, res) => {
  res.send(`<div style='text-align:center'>
  <h1 >Server Running and Connected</h1>
  <button style='background-color:blue;width:100px;height:20px;border-radius:15%;>Go</button></div>
  `);
});

module.exports = welcomeRouter;
