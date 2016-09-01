var Promise, Route, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Route = require('../models/Route');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Route.findAll(filter.create(req.query)).then(function(Routes) {
      res.status(200);
      return res.send(Routes);
    });
  };
  get = function(req, res) {
    return Route.findById(req.params.id).then(function(Routes) {
      res.status(200);
      return res.send(Routes);
    });
  };
  create = function(req, res) {
    return Route.create(req.body).then(function(Route) {
      res.status(200);
      return res.send(Route);
    });
  };
  update = function(req, res) {
    return Route.findById(req.params.id).then(function(Route) {
      if (Route == null) {
        res.status(400);
        return res.send('Route not found');
      } else {
        _.extend(Route, req.body);
        return Route.save().then(function(Route) {
          res.status(200);
          return res.send(Route);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Route.findById(req.params.id).then(function(Route) {
      if (Route == null) {
        res.status(400);
        return res.send('Route not found');
      } else {
        return Route.destroy().then(function(Route) {
          res.status(200);
          return res.send(Route);
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
