var Promise, Suggestion, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Suggestion = require('../models/Suggestion');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Suggestion.findAll(filter.create(req.query)).then(function(Suggestions) {
      res.status(200);
      return res.send(Suggestions);
    });
  };
  get = function(req, res) {
    return Suggestion.findById(req.params.id).then(function(Suggestions) {
      res.status(200);
      return res.send(Suggestions);
    });
  };
  create = function(req, res) {
    return Suggestion.create(req.body).then(function(Suggestion) {
      res.status(200);
      return res.send(Suggestion);
    });
  };
  update = function(req, res) {
    return Suggestion.findById(req.params.id).then(function(Suggestion) {
      if (Suggestion == null) {
        res.status(400);
        return res.send('Suggestion not found');
      } else {
        _.extend(Suggestion, req.body);
        return Suggestion.save().then(function(Suggestion) {
          res.status(200);
          return res.send(Suggestion);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Suggestion.findById(req.params.id).then(function(Suggestion) {
      if (Suggestion == null) {
        res.status(400);
        return res.send('Suggestion not found');
      } else {
        return Suggestion.destroy().then(function(Suggestion) {
          res.status(200);
          return res.send(Suggestion);
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
