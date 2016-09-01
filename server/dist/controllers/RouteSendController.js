var Promise, RouteSend, _, filter;

Promise = require('bluebird');

_ = require('underscore');

RouteSend = require('../models/RouteSend');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return RouteSend.findAll({
      where: req.query
    }).then(function(RouteSends) {
      res.status(200);
      return res.send(RouteSends);
    });
  };
  get = function(req, res) {
    return RouteSend.findById(req.params.id).then(function(RouteSends) {
      res.status(200);
      return res.send(RouteSends);
    });
  };
  create = function(req, res) {
    return RouteSend.create(req.body).then(function(RouteSend) {
      res.status(200);
      return res.send(RouteSend);
    });
  };
  update = function(req, res) {
    return RouteSend.findById(req.params.id).then(function(RouteSend) {
      if (RouteSend == null) {
        res.status(400);
        return res.send('RouteSend not found');
      } else {
        return RouteSend.destroy().then(function(RouteSend) {
          res.status(200);
          return res.send(RouteSend);
        });
      }
    });
  };
  destroy = function(req, res) {
    return RouteSend.findById(req.params.id).then(function(RouteSend) {
      if (RouteSend == null) {
        res.status(400);
        return res.send('RouteSend not found');
      } else {
        return RouteSend.destroy().then(function(RouteSend) {
          res.status(200);
          return res.send(RouteSend);
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
