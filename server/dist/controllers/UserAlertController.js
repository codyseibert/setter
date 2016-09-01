var Promise, UserAlert, _, filter;

Promise = require('bluebird');

_ = require('underscore');

UserAlert = require('../models/UserAlert');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return UserAlert.findAll({
      where: req.query
    }).then(function(UserAlerts) {
      res.status(200);
      return res.send(UserAlerts);
    });
  };
  get = function(req, res) {
    return UserAlert.findById(req.params.id).then(function(UserAlerts) {
      res.status(200);
      return res.send(UserAlerts);
    });
  };
  create = function(req, res) {
    return UserAlert.create(req.body).then(function(UserAlert) {
      res.status(200);
      return res.send(UserAlert);
    });
  };
  update = function(req, res) {
    return UserAlert.findById(req.params.id).then(function(UserAlert) {
      if (UserAlert == null) {
        res.status(400);
        return res.send('UserAlert not found');
      } else {
        return UserAlert.destroy().then(function(UserAlert) {
          res.status(200);
          return res.send(UserAlert);
        });
      }
    });
  };
  destroy = function(req, res) {
    return UserAlert.findById(req.params.id).then(function(UserAlert) {
      if (UserAlert == null) {
        res.status(400);
        return res.send('UserAlert not found');
      } else {
        return UserAlert.destroy().then(function(UserAlert) {
          res.status(200);
          return res.send(UserAlert);
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
