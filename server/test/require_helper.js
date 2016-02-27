// require_helper.js
module.exports = function (path) {
  return __dirname + "/.." + (process.env.APP_DIR_FOR_CODE_COVERAGE || '/src/') + path;
};