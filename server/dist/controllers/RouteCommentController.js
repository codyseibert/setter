var Promise, RouteComment, _, filter;

Promise = require('bluebird');

_ = require('underscore');

RouteComment = require('../models/RouteComment');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return RouteComment.findAll({
      where: req.query
    }).then(function(RouteComments) {
      res.status(200);
      return res.send(RouteComments);
    });
  };
  get = function(req, res) {
    return RouteComment.findById(req.params.id).then(function(RouteComments) {
      res.status(200);
      return res.send(RouteComments);
    });
  };
  create = function(req, res) {
    return RouteComment.create(req.body).then(function(RouteComment) {
      res.status(200);
      return res.send(RouteComment);
    });
  };
  update = function(req, res) {
    return RouteComment.findById(req.params.id).then(function(RouteComment) {
      if (RouteComment == null) {
        res.status(400);
        return res.send('RouteComment not found');
      } else {
        return RouteComment.destroy().then(function(RouteComment) {
          res.status(200);
          return res.send(RouteComment);
        });
      }
    });
  };
  destroy = function(req, res) {
    return RouteComment.findById(req.params.id).then(function(RouteComment) {
      if (RouteComment == null) {
        res.status(400);
        return res.send('RouteComment not found');
      } else {
        return RouteComment.destroy().then(function(RouteComment) {
          res.status(200);
          return res.send(RouteComment);
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
