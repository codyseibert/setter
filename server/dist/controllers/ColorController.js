var Color, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Color = require('../models/Color');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Color.findAll(filter.create(req.query)).then(function(Colors) {
      res.status(200);
      return res.send(Colors);
    });
  };
  get = function(req, res) {
    return Color.findById(req.params.id).then(function(Colors) {
      res.status(200);
      return res.send(Colors);
    });
  };
  create = function(req, res) {
    return Color.create(req.body).then(function(Color) {
      res.status(200);
      return res.send(Color);
    });
  };
  update = function(req, res) {
    return Color.findById(req.params.id).then(function(Color) {
      if (Color == null) {
        res.status(400);
        return res.send('Color not found');
      } else {
        _.extend(Color, req.body);
        return Color.save().then(function(Color) {
          res.status(200);
          return res.send(Color);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Color.findById(req.params.id).then(function(Color) {
      if (Color == null) {
        res.status(400);
        return res.send('Color not found');
      } else {
        return Color.destroy().then(function(Color) {
          res.status(200);
          return res.send(Color);
        });
      }
    });
  };
  return {
    find: find,
    get: get,
    create: create,
    update: update,
    destroy: destroy
  };
})();
