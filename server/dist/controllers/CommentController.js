var Comment, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Comment = require('../models/Comment');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Comment.findAll(filter.create(req.query)).then(function(Comments) {
      res.status(200);
      return res.send(Comments);
    });
  };
  get = function(req, res) {
    return Comment.findById(req.params.id).then(function(Comments) {
      res.status(200);
      return res.send(Comments);
    });
  };
  create = function(req, res) {
    return Comment.create(req.body).then(function(Comment) {
      res.status(200);
      return res.send(Comment);
    });
  };
  update = function(req, res) {
    return Comment.findById(req.params.id).then(function(Comment) {
      if (Comment == null) {
        res.status(400);
        return res.send('Comment not found');
      } else {
        _.extend(Comment, req.body);
        return Comment.save().then(function(Comment) {
          res.status(200);
          return res.send(Comment);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Comment.findById(req.params.id).then(function(Comment) {
      if (Comment == null) {
        res.status(400);
        return res.send('Comment not found');
      } else {
        return Comment.destroy().then(function(Comment) {
          res.status(200);
          return res.send(Comment);
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
