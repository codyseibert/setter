var Promise, RouteColors, _, filter;

Promise = require('bluebird');

_ = require('underscore');

RouteColors = require('../models/RouteColors');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return RouteColors.findAll({
      where: req.query
    }).then(function(RouteColorss) {
      res.status(200);
      return res.send(RouteColorss);
    });
  };
  get = function(req, res) {
    return RouteColors.findById(req.params.id).then(function(RouteColorss) {
      res.status(200);
      return res.send(RouteColorss);
    });
  };
  create = function(req, res) {
    return RouteColors.create(req.body).then(function(RouteColors) {
      res.status(200);
      return res.send(RouteColors);
    });
  };
  update = function(req, res) {
    return RouteColors.findById(req.params.id).then(function(RouteColors) {
      if (RouteColors == null) {
        res.status(400);
        return res.send('RouteColors not found');
      } else {
        return RouteColors.destroy().then(function(RouteColors) {
          res.status(200);
          return res.send(RouteColors);
        });
      }
    });
  };
  destroy = function(req, res) {
    return RouteColors.findById(req.params.id).then(function(RouteColors) {
      if (RouteColors == null) {
        res.status(400);
        return res.send('RouteColors not found');
      } else {
        return RouteColors.destroy().then(function(RouteColors) {
          res.status(200);
          return res.send(RouteColors);
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
