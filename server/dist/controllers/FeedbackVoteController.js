var FeedbackVote, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

FeedbackVote = require('../models/FeedbackVote');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return FeedbackVote.findAll(filter.create(req.query)).then(function(FeedbackVotes) {
      res.status(200);
      return res.send(FeedbackVotes);
    });
  };
  get = function(req, res) {
    return FeedbackVote.findById(req.params.id).then(function(FeedbackVotes) {
      res.status(200);
      return res.send(FeedbackVotes);
    });
  };
  create = function(req, res) {
    return FeedbackVote.create(req.body).then(function(FeedbackVote) {
      res.status(200);
      return res.send(FeedbackVote);
    });
  };
  update = function(req, res) {
    return FeedbackVote.findById(req.params.id).then(function(FeedbackVote) {
      if (FeedbackVote == null) {
        res.status(400);
        return res.send('FeedbackVote not found');
      } else {
        _.extend(FeedbackVote, req.body);
        return FeedbackVote.save().then(function(FeedbackVote) {
          res.status(200);
          return res.send(FeedbackVote);
        });
      }
    });
  };
  destroy = function(req, res) {
    return FeedbackVote.findById(req.params.id).then(function(FeedbackVote) {
      if (FeedbackVote == null) {
        res.status(400);
        return res.send('FeedbackVote not found');
      } else {
        return FeedbackVote.destroy().then(function(FeedbackVote) {
          res.status(200);
          return res.send(FeedbackVote);
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
