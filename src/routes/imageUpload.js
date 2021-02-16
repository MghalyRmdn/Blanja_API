const imageUploadRouter = require("express").Router();

const singleUpload = require("../helpers/middlewares/upload");

const multiUpload = require("../helpers/middlewares/multiUpload");

// imageUploadRouter.post("/", singleUpload, (req, res) => {
//   const filePath = "/images/" + req.file.filename;
//   res.json({
//     filePath,
//   });
// });

imageUploadRouter.post("/", multiUpload, (req, res) => {
  //const filePath = "/images/" + req.file.filename;
  //const filePath = req.files;
  const toupload = process.env.SERVER 
  const filesPath = JSON.stringify(
    req.files.map((e) => toupload + '/images/' + e.filename)
  );
  const back = JSON.parse(filesPath);
  res.json({ string: filesPath, arrJson: back });
});

module.exports = imageUploadRouter;
