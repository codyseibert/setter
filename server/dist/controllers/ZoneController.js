var Promise, Zone, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Zone = require('../models/Zone');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Zone.findAll(filter.create(req.query)).then(function(Zones) {
      res.status(200);
      return res.send(Zones);
    });
  };
  get = function(req, res) {
    return Zone.findById(req.params.id).then(function(Zones) {
      res.status(200);
      return res.send(Zones);
    });
  };
  create = function(req, res) {
    return Zone.create(req.body).then(function(Zone) {
      res.status(200);
      return res.send(Zone);
    });
  };
  update = function(req, res) {
    return Zone.findById(req.params.id).then(function(Zone) {
      if (Zone == null) {
        res.status(400);
        return res.send('Zone not found');
      } else {
        _.extend(Zone, req.body);
        return Zone.save().then(function(Zone) {
          res.status(200);
          return res.send(Zone);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Zone.findById(req.params.id).then(function(Zone) {
      if (Zone == null) {
        res.status(400);
        return res.send('Zone not found');
      } else {
        return Zone.destroy().then(function(Zone) {
          res.status(200);
          return res.send(Zone);
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
