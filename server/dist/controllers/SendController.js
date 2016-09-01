var Promise, Send, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Send = require('../models/Send');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Send.findAll(filter.create(req.query)).then(function(Sends) {
      res.status(200);
      return res.send(Sends);
    });
  };
  get = function(req, res) {
    return Send.findById(req.params.id).then(function(Sends) {
      res.status(200);
      return res.send(Sends);
    });
  };
  create = function(req, res) {
    return Send.create(req.body).then(function(Send) {
      res.status(200);
      return res.send(Send);
    });
  };
  update = function(req, res) {
    return Send.findById(req.params.id).then(function(Send) {
      if (Send == null) {
        res.status(400);
        return res.send('Send not found');
      } else {
        _.extend(Send, req.body);
        return Send.save().then(function(Send) {
          res.status(200);
          return res.send(Send);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Send.findById(req.params.id).then(function(Send) {
      if (Send == null) {
        res.status(400);
        return res.send('Send not found');
      } else {
        return Send.destroy().then(function(Send) {
          res.status(200);
          return res.send(Send);
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
