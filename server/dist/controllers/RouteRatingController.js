var Promise, RouteRating, _, filter;

Promise = require('bluebird');

_ = require('underscore');

RouteRating = require('../models/RouteRating');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return RouteRating.findAll({
      where: req.query
    }).then(function(RouteRatings) {
      res.status(200);
      return res.send(RouteRatings);
    });
  };
  get = function(req, res) {
    return RouteRating.findById(req.params.id).then(function(RouteRatings) {
      res.status(200);
      return res.send(RouteRatings);
    });
  };
  create = function(req, res) {
    return RouteRating.create(req.body).then(function(RouteRating) {
      res.status(200);
      return res.send(RouteRating);
    });
  };
  update = function(req, res) {
    return RouteRating.findById(req.params.id).then(function(RouteRating) {
      if (RouteRating == null) {
        res.status(400);
        return res.send('RouteRating not found');
      } else {
        return RouteRating.destroy().then(function(RouteRating) {
          res.status(200);
          return res.send(RouteRating);
        });
      }
    });
  };
  destroy = function(req, res) {
    return RouteRating.findById(req.params.id).then(function(RouteRating) {
      if (RouteRating == null) {
        res.status(400);
        return res.send('RouteRating not found');
      } else {
        return RouteRating.destroy().then(function(RouteRating) {
          res.status(200);
          return res.send(RouteRating);
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
