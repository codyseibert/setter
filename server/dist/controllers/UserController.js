var Promise, User, _, filter;

Promise = require('bluebird');

_ = require('underscore');

User = require('../models/User');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return User.findAll(filter.create(req.query)).then(function(Users) {
      res.status(200);
      return res.send(Users);
    });
  };
  get = function(req, res) {
    return User.findById(req.params.id).then(function(Users) {
      res.status(200);
      return res.send(Users);
    });
  };
  create = function(req, res) {
    return User.create(req.body).then(function(User) {
      res.status(200);
      return res.send(User);
    });
  };
  update = function(req, res) {
    return User.findById(req.params.id).then(function(User) {
      if (User == null) {
        res.status(400);
        return res.send('User not found');
      } else {
        _.extend(User, req.body);
        return User.save().then(function(User) {
          res.status(200);
          return res.send(User);
        });
      }
    });
  };
  destroy = function(req, res) {
    return User.findById(req.params.id).then(function(User) {
      if (User == null) {
        res.status(400);
        return res.send('User not found');
      } else {
        return User.destroy().then(function(User) {
          res.status(200);
          return res.send(User);
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
