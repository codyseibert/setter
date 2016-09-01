var Promise, RouteBoulderGrades, _, filter;

Promise = require('bluebird');

_ = require('underscore');

RouteBoulderGrades = require('../models/RouteBoulderGrades');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return RouteBoulderGrades.findAll({
      where: req.query
    }).then(function(RouteBoulderGradess) {
      res.status(200);
      return res.send(RouteBoulderGradess);
    });
  };
  get = function(req, res) {
    return RouteBoulderGrades.findById(req.params.id).then(function(RouteBoulderGradess) {
      res.status(200);
      return res.send(RouteBoulderGradess);
    });
  };
  create = function(req, res) {
    return RouteBoulderGrades.create(req.body).then(function(RouteBoulderGrades) {
      res.status(200);
      return res.send(RouteBoulderGrades);
    });
  };
  update = function(req, res) {
    return RouteBoulderGrades.findById(req.params.id).then(function(RouteBoulderGrades) {
      if (RouteBoulderGrades == null) {
        res.status(400);
        return res.send('RouteBoulderGrades not found');
      } else {
        return RouteBoulderGrades.destroy().then(function(RouteBoulderGrades) {
          res.status(200);
          return res.send(RouteBoulderGrades);
        });
      }
    });
  };
  destroy = function(req, res) {
    return RouteBoulderGrades.findById(req.params.id).then(function(RouteBoulderGrades) {
      if (RouteBoulderGrades == null) {
        res.status(400);
        return res.send('RouteBoulderGrades not found');
      } else {
        return RouteBoulderGrades.destroy().then(function(RouteBoulderGrades) {
          res.status(200);
          return res.send(RouteBoulderGrades);
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
