var Promise, Setter, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Setter = require('../models/Setter');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Setter.findAll(filter.create(req.query)).then(function(Setters) {
      res.status(200);
      return res.send(Setters);
    });
  };
  get = function(req, res) {
    return Setter.findById(req.params.id).then(function(Setters) {
      res.status(200);
      return res.send(Setters);
    });
  };
  create = function(req, res) {
    return Setter.create(req.body).then(function(Setter) {
      res.status(200);
      return res.send(Setter);
    });
  };
  update = function(req, res) {
    return Setter.findById(req.params.id).then(function(Setter) {
      if (Setter == null) {
        res.status(400);
        return res.send('Setter not found');
      } else {
        _.extend(Setter, req.body);
        return Setter.save().then(function(Setter) {
          res.status(200);
          return res.send(Setter);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Setter.findById(req.params.id).then(function(Setter) {
      if (Setter == null) {
        res.status(400);
        return res.send('Setter not found');
      } else {
        return Setter.destroy().then(function(Setter) {
          res.status(200);
          return res.send(Setter);
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
