const userModel = require("../models/Users");
const form = require("../helpers/form");

module.exports = {
  getUser: (req, res) => {
    const { id } = req.params;
    userModel
      .getUser(id)
      .then((data) => {
        console.log(data);
        res.json({
          data,
        });
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
  updateProfile: (req, res) => {
    const { body } = req;
    console.log(req);
    const { id } = req.params;
    userModel
      .updateProfile(body, id)
      .then((data) => {
        res.json({
          status: 200,
          data,
        });
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
  changePhoto: (req, res) => {
    const { id } = req.params;
    const image = req.filePath;
    userModel
      .getOldPhoto(id)
      .then((result) => {
        const ImageToDelete = result.image;
        userModel
          .changePhoto(image, id)
          .then((result) => {
            if (ImageToDelete != null) {
              false.unlink(`public${ImageToDelete}`, (err) => {
                if (err) {
                  console.log(err);
                  return ;
                } else {
                  console.log(`public${image} deleted`);
                }
              });
            }
            let data = {};
            data.image = image;
            res.json({
              status: 200,
              ...result,
              data,
            });
          })
          .catch((err) => {
            form.error(res, err);
          });
      })
      .catch((err) => {
        form.error(res, err);
      });
  },
};
