var GymSuggestion, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

GymSuggestion = require('../models/GymSuggestion');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return GymSuggestion.findAll({
      where: req.query
    }).then(function(GymSuggestions) {
      res.status(200);
      return res.send(GymSuggestions);
    });
  };
  get = function(req, res) {
    return GymSuggestion.findById(req.params.id).then(function(GymSuggestions) {
      res.status(200);
      return res.send(GymSuggestions);
    });
  };
  create = function(req, res) {
    return GymSuggestion.create(req.body).then(function(GymSuggestion) {
      res.status(200);
      return res.send(GymSuggestion);
    });
  };
  update = function(req, res) {
    return GymSuggestion.findById(req.params.id).then(function(GymSuggestion) {
      if (GymSuggestion == null) {
        res.status(400);
        return res.send('GymSuggestion not found');
      } else {
        return GymSuggestion.destroy().then(function(GymSuggestion) {
          res.status(200);
          return res.send(GymSuggestion);
        });
      }
    });
  };
  destroy = function(req, res) {
    return GymSuggestion.findById(req.params.id).then(function(GymSuggestion) {
      if (GymSuggestion == null) {
        res.status(400);
        return res.send('GymSuggestion not found');
      } else {
        return GymSuggestion.destroy().then(function(GymSuggestion) {
          res.status(200);
          return res.send(GymSuggestion);
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
