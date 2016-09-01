var Feedback, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Feedback = require('../models/Feedback');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Feedback.findAll(filter.create(req.query)).then(function(Feedbacks) {
      res.status(200);
      return res.send(Feedbacks);
    });
  };
  get = function(req, res) {
    return Feedback.findById(req.params.id).then(function(Feedbacks) {
      res.status(200);
      return res.send(Feedbacks);
    });
  };
  create = function(req, res) {
    return Feedback.create(req.body).then(function(Feedback) {
      res.status(200);
      return res.send(Feedback);
    });
  };
  update = function(req, res) {
    return Feedback.findById(req.params.id).then(function(Feedback) {
      if (Feedback == null) {
        res.status(400);
        return res.send('Feedback not found');
      } else {
        _.extend(Feedback, req.body);
        return Feedback.save().then(function(Feedback) {
          res.status(200);
          return res.send(Feedback);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Feedback.findById(req.params.id).then(function(Feedback) {
      if (Feedback == null) {
        res.status(400);
        return res.send('Feedback not found');
      } else {
        return Feedback.destroy().then(function(Feedback) {
          res.status(200);
          return res.send(Feedback);
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
