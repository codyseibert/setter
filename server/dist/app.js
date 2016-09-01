var bodyParser, cors, express, morgan;

express = require('express');

bodyParser = require('body-parser');

cors = require('cors');

morgan = require('morgan');

module.exports = (function() {
  var app;
  app = express();
  app.use(bodyParser.json());
  app.use(morgan('combined'));
  app.use(cors());
  return app;
})();
