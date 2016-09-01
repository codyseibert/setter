var Promise, SetterGymAccess, _, filter;

Promise = require('bluebird');

_ = require('underscore');

SetterGymAccess = require('../models/SetterGymAccess');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return SetterGymAccess.findAll({
      where: req.query
    }).then(function(SetterGymAccesss) {
      res.status(200);
      return res.send(SetterGymAccesss);
    });
  };
  get = function(req, res) {
    return SetterGymAccess.findById(req.params.id).then(function(SetterGymAccesss) {
      res.status(200);
      return res.send(SetterGymAccesss);
    });
  };
  create = function(req, res) {
    return SetterGymAccess.create(req.body).then(function(SetterGymAccess) {
      res.status(200);
      return res.send(SetterGymAccess);
    });
  };
  update = function(req, res) {
    return SetterGymAccess.findById(req.params.id).then(function(SetterGymAccess) {
      if (SetterGymAccess == null) {
        res.status(400);
        return res.send('SetterGymAccess not found');
      } else {
        return SetterGymAccess.destroy().then(function(SetterGymAccess) {
          res.status(200);
          return res.send(SetterGymAccess);
        });
      }
    });
  };
  destroy = function(req, res) {
    return SetterGymAccess.findById(req.params.id).then(function(SetterGymAccess) {
      if (SetterGymAccess == null) {
        res.status(400);
        return res.send('SetterGymAccess not found');
      } else {
        return SetterGymAccess.destroy().then(function(SetterGymAccess) {
          res.status(200);
          return res.send(SetterGymAccess);
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
