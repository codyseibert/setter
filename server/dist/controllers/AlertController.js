var Alert, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Alert = require('../models/Alert');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Alert.findAll(filter.create(req.query)).then(function(Alerts) {
      res.status(200);
      return res.send(Alerts);
    });
  };
  get = function(req, res) {
    return Alert.findById(req.params.id).then(function(Alerts) {
      res.status(200);
      return res.send(Alerts);
    });
  };
  create = function(req, res) {
    return Alert.create(req.body).then(function(Alert) {
      res.status(200);
      return res.send(Alert);
    });
  };
  update = function(req, res) {
    return Alert.findById(req.params.id).then(function(Alert) {
      if (Alert == null) {
        res.status(400);
        return res.send('Alert not found');
      } else {
        _.extend(Alert, req.body);
        return Alert.save().then(function(Alert) {
          res.status(200);
          return res.send(Alert);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Alert.findById(req.params.id).then(function(Alert) {
      if (Alert == null) {
        res.status(400);
        return res.send('Alert not found');
      } else {
        return Alert.destroy().then(function(Alert) {
          res.status(200);
          return res.send(Alert);
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
