var Promise, RouteNewToUser, _, filter;

Promise = require('bluebird');

_ = require('underscore');

RouteNewToUser = require('../models/RouteNewToUser');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return RouteNewToUser.findAll(filter.create(req.query)).then(function(RouteNewToUsers) {
      res.status(200);
      return res.send(RouteNewToUsers);
    });
  };
  get = function(req, res) {
    return RouteNewToUser.findById(req.params.id).then(function(RouteNewToUsers) {
      res.status(200);
      return res.send(RouteNewToUsers);
    });
  };
  create = function(req, res) {
    return RouteNewToUser.create(req.body).then(function(RouteNewToUser) {
      res.status(200);
      return res.send(RouteNewToUser);
    });
  };
  update = function(req, res) {
    return RouteNewToUser.findById(req.params.id).then(function(RouteNewToUser) {
      if (RouteNewToUser == null) {
        res.status(400);
        return res.send('RouteNewToUser not found');
      } else {
        _.extend(RouteNewToUser, req.body);
        return RouteNewToUser.save().then(function(RouteNewToUser) {
          res.status(200);
          return res.send(RouteNewToUser);
        });
      }
    });
  };
  destroy = function(req, res) {
    return RouteNewToUser.findById(req.params.id).then(function(RouteNewToUser) {
      if (RouteNewToUser == null) {
        res.status(400);
        return res.send('RouteNewToUser not found');
      } else {
        return RouteNewToUser.destroy().then(function(RouteNewToUser) {
          res.status(200);
          return res.send(RouteNewToUser);
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
