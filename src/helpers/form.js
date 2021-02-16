module.exports = {
  success: (res, data) => {
    const resObject = {
      success: true,
      status: 200,
      data,
    };
    res.json(resObject);
  },
  error: (res, err) => {
    const resObject = {
      success: false,
      status: 500,
      err,
    }
    res.json(resObject);
  },
};
