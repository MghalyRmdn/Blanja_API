const multer = require("multer");
const path = require("path");
const toUpload = process.env.SERVER;
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./public/images");
  },
  filename: (req, file, cb) => {
    const nameFormat = `${Date.now()}-${file.fieldname}${path.extname(
      file.originalname
    )}`;
    cb(null, nameFormat);
  },
});

const limits = {
  fileSize: 5 * 1000 * 1000,
};

const fileFilter = (req, file, cb) => {
  const fileTypes = /jpg|jpeg|png|gif/;
  const extname = fileTypes.test(path.extname(file.originalname).toLowerCase());
  if (extname) {
    cb(null, true);
  } else {
    cb("error: Image only");
  }
};

const upload = multer({
  storage,
  limits,
  fileFilter,
});

const uploadImage = {
  singleUpload: (req, res, next) => {
    const singleUpload = upload.single("photo");
    singleUpload(req, res, (err) => {
      console.log(req.file);
      if (err) {
        res.json({
          msg: err,
        });
      } else {
        try {
          req.body.photo_user = `${toUpload}/images/${req.file.filename}`;
        } catch (err) {
          console.log(err);
        } finally {
          next();
        }
      }
    });
  },
  multiUpload: (req, res, next) => {
    const multiUpload = upload.array("photo", 5);
    multiUpload(req, res, (err) => {
      // console.log(req.file);
      if (err) {
        res.json({
          msg: err,
        });
      } else {
        try {
          const img = req.files.map((item) => {
            return `${toUpload}/images/${item.filename}`
          })
          req.body.photo_user = img.join(',');
        } catch (err) {
          console.log(err);
        } finally {
          next();
        }
      }
    });
  },
};

module.exports = uploadImage;
