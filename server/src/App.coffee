###jslint unparam: true, nomen: true###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

path = require('path')
express = require('express')
bodyParser = require('body-parser')
cookieParser = require('cookie-parser')
multer = require('multer')
favicon = require('serve-favicon')
logger = require('morgan')
cors = require('cors')

App = ->
  'use strict'
  app = express()
  days2 = 86400000 * 2
  app.use bodyParser.json()
  app.use cookieParser()
  app.use multer(dest: __dirname + '/public/images/uploads')
  app.use favicon(path.join(__dirname, 'public', 'images', 'favicon.ico'))
  app.use cors()
  if process.env.SETTER_PRODUCTION
    app.use express.static(__dirname + '/public', maxAge: days2)
  else
    app.use express.static(__dirname + '/public')
    app.use logger('dev')
  app

module.exports = new App
