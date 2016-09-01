var Promise, SuggestionVotes, _, filter;

Promise = require('bluebird');

_ = require('underscore');

SuggestionVotes = require('../models/SuggestionVotes');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return SuggestionVotes.findAll({
      where: req.query
    }).then(function(SuggestionVotess) {
      res.status(200);
      return res.send(SuggestionVotess);
    });
  };
  get = function(req, res) {
    return SuggestionVotes.findById(req.params.id).then(function(SuggestionVotess) {
      res.status(200);
      return res.send(SuggestionVotess);
    });
  };
  create = function(req, res) {
    return SuggestionVotes.create(req.body).then(function(SuggestionVotes) {
      res.status(200);
      return res.send(SuggestionVotes);
    });
  };
  update = function(req, res) {
    return SuggestionVotes.findById(req.params.id).then(function(SuggestionVotes) {
      if (SuggestionVotes == null) {
        res.status(400);
        return res.send('SuggestionVotes not found');
      } else {
        return SuggestionVotes.destroy().then(function(SuggestionVotes) {
          res.status(200);
          return res.send(SuggestionVotes);
        });
      }
    });
  };
  destroy = function(req, res) {
    return SuggestionVotes.findById(req.params.id).then(function(SuggestionVotes) {
      if (SuggestionVotes == null) {
        res.status(400);
        return res.send('SuggestionVotes not found');
      } else {
        return SuggestionVotes.destroy().then(function(SuggestionVotes) {
          res.status(200);
          return res.send(SuggestionVotes);
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
