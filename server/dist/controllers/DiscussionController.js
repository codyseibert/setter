var Discussion, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Discussion = require('../models/Discussion');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Discussion.findAll(filter.create(req.query)).then(function(discussions) {
      res.status(200);
      return res.send(discussions);
    });
  };
  get = function(req, res) {
    return Discussion.findById(req.params.id).then(function(discussion) {
      res.status(200);
      return res.send(discussion);
    });
  };
  create = function(req, res) {
    return Discussion.create(req.body).then(function(discussion) {
      res.status(200);
      return res.send(discussion);
    });
  };
  update = function(req, res) {
    return Discussion.update(req.body, {
      where: {
        id: req.params.id
      }
    }).then(function() {
      res.status(200);
      return res.send(req.body);
    });
  };
  destroy = function(req, res) {
    return Discussion.destroy({
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
