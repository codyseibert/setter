app = require './app'

multer = require 'multer'
upload = multer dest: process.env.UPLOAD_DIR or '/tmp'

FileController = require './controllers/FileController'

module.exports = do ->
  app.post '/File', upload.single('file'), FileController.create
