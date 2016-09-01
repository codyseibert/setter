var BoulderGrades, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

BoulderGrades = require('../models/BoulderGrades');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return BoulderGrades.findAll(filter.create(req.query)).then(function(BoulderGradess) {
      res.status(200);
      return res.send(BoulderGradess);
    });
  };
  get = function(req, res) {
    return BoulderGrades.findById(req.params.id).then(function(BoulderGradess) {
      res.status(200);
      return res.send(BoulderGradess);
    });
  };
  create = function(req, res) {
    return BoulderGrades.create(req.body).then(function(BoulderGrades) {
      res.status(200);
      return res.send(BoulderGrades);
    });
  };
  update = function(req, res) {
    return BoulderGrades.findById(req.params.id).then(function(BoulderGrades) {
      if (BoulderGrades == null) {
        res.status(400);
        return res.send('BoulderGrades not found');
      } else {
        _.extend(BoulderGrades, req.body);
        return BoulderGrades.save().then(function(BoulderGrades) {
          res.status(200);
          return res.send(BoulderGrades);
        });
      }
    });
  };
  destroy = function(req, res) {
    return BoulderGrades.findById(req.params.id).then(function(BoulderGrades) {
      if (BoulderGrades == null) {
        res.status(400);
        return res.send('BoulderGrades not found');
      } else {
        return BoulderGrades.destroy().then(function(BoulderGrades) {
          res.status(200);
          return res.send(BoulderGrades);
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
