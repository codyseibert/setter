var FileController, app, multer, upload;

app = require('./app');

multer = require('multer');

upload = multer({
  dest: process.env.UPLOAD_DIR || '/tmp'
});

FileController = require('./controllers/FileController');

module.exports = (function() {
  return app.post('/File', upload.single('file'), FileController.create);
})();
