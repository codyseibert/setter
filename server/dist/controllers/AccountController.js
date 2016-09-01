var Account, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Account = require('../models/Account');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Account.findAll(filter.create(req.query)).then(function(Accounts) {
      res.status(200);
      return res.send(Accounts);
    });
  };
  get = function(req, res) {
    return Account.findById(req.params.id).then(function(Accounts) {
      res.status(200);
      return res.send(Accounts);
    });
  };
  create = function(req, res) {
    return Account.create(req.body).then(function(Account) {
      res.status(200);
      return res.send(Account);
    });
  };
  update = function(req, res) {
    return Account.findById(req.params.id).then(function(Account) {
      if (Account == null) {
        res.status(400);
        return res.send('Account not found');
      } else {
        _.extend(Account, req.body);
        return Account.save().then(function(Account) {
          res.status(200);
          return res.send(Account);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Account.findById(req.params.id).then(function(Account) {
      if (Account == null) {
        res.status(400);
        return res.send('Account not found');
      } else {
        return Account.destroy().then(function(Account) {
          res.status(200);
          return res.send(Account);
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
