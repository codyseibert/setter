express = require 'express'
bodyParser = require 'body-parser'
cors = require 'cors'
morgan = require 'morgan'

module.exports = do ->
  app = express()
  app.use bodyParser.json()
  app.use morgan 'combined'
  app.use cors()
  app
