var Promise, Wall, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Wall = require('../models/Wall');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Wall.findAll({
      where: req.query
    }).then(function(Walls) {
      res.status(200);
      return res.send(Walls);
    });
  };
  get = function(req, res) {
    return Wall.findById(req.params.id).then(function(Walls) {
      res.status(200);
      return res.send(Walls);
    });
  };
  create = function(req, res) {
    return Wall.create(req.body).then(function(Wall) {
      res.status(200);
      return res.send(Wall);
    });
  };
  update = function(req, res) {
    return Wall.findById(req.params.id).then(function(Wall) {
      if (Wall == null) {
        res.status(400);
        return res.send('Wall not found');
      } else {
        return Wall.destroy().then(function(Wall) {
          res.status(200);
          return res.send(Wall);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Wall.findById(req.params.id).then(function(Wall) {
      if (Wall == null) {
        res.status(400);
        return res.send('Wall not found');
      } else {
        return Wall.destroy().then(function(Wall) {
          res.status(200);
          return res.send(Wall);
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
