var Promise, RopeGrades, _, filter;

Promise = require('bluebird');

_ = require('underscore');

RopeGrades = require('../models/RopeGrades');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return RopeGrades.findAll(filter.create(req.query)).then(function(RopeGradess) {
      res.status(200);
      return res.send(RopeGradess);
    });
  };
  get = function(req, res) {
    return RopeGrades.findById(req.params.id).then(function(RopeGradess) {
      res.status(200);
      return res.send(RopeGradess);
    });
  };
  create = function(req, res) {
    return RopeGrades.create(req.body).then(function(RopeGrades) {
      res.status(200);
      return res.send(RopeGrades);
    });
  };
  update = function(req, res) {
    return RopeGrades.findById(req.params.id).then(function(RopeGrades) {
      if (RopeGrades == null) {
        res.status(400);
        return res.send('RopeGrades not found');
      } else {
        _.extend(RopeGrades, req.body);
        return RopeGrades.save().then(function(RopeGrades) {
          res.status(200);
          return res.send(RopeGrades);
        });
      }
    });
  };
  destroy = function(req, res) {
    return RopeGrades.findById(req.params.id).then(function(RopeGrades) {
      if (RopeGrades == null) {
        res.status(400);
        return res.send('RopeGrades not found');
      } else {
        return RopeGrades.destroy().then(function(RopeGrades) {
          res.status(200);
          return res.send(RopeGrades);
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
