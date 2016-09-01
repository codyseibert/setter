var GymAlert, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

GymAlert = require('../models/GymAlert');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return GymAlert.findAll({
      where: req.query
    }).then(function(GymAlerts) {
      res.status(200);
      return res.send(GymAlerts);
    });
  };
  get = function(req, res) {
    return GymAlert.findById(req.params.id).then(function(GymAlerts) {
      res.status(200);
      return res.send(GymAlerts);
    });
  };
  create = function(req, res) {
    return GymAlert.create(req.body).then(function(GymAlert) {
      res.status(200);
      return res.send(GymAlert);
    });
  };
  update = function(req, res) {
    return GymAlert.update(req.body, {
      where: {
        id: req.params.id
      }
    }).then(function() {
      res.status(200);
      return res.send(req.body);
    });
  };
  destroy = function(req, res) {
    return GymAlert.destroy({
      where: {
        id: req.params.id
      }
    }).then(function() {
      res.status(200);
      return res.send('success');
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
