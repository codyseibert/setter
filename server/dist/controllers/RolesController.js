var Promise, Roles, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Roles = require('../models/Roles');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Roles.findAll(filter.create(req.query)).then(function(Roless) {
      res.status(200);
      return res.send(Roless);
    });
  };
  get = function(req, res) {
    return Roles.findById(req.params.id).then(function(Roless) {
      res.status(200);
      return res.send(Roless);
    });
  };
  create = function(req, res) {
    return Roles.create(req.body).then(function(Roles) {
      res.status(200);
      return res.send(Roles);
    });
  };
  update = function(req, res) {
    return Roles.findById(req.params.id).then(function(Roles) {
      if (Roles == null) {
        res.status(400);
        return res.send('Roles not found');
      } else {
        _.extend(Roles, req.body);
        return Roles.save().then(function(Roles) {
          res.status(200);
          return res.send(Roles);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Roles.findById(req.params.id).then(function(Roles) {
      if (Roles == null) {
        res.status(400);
        return res.send('Roles not found');
      } else {
        return Roles.destroy().then(function(Roles) {
          res.status(200);
          return res.send(Roles);
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
