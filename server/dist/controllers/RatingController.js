var Promise, Rating, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Rating = require('../models/Rating');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Rating.findAll(filter.create(req.query)).then(function(Ratings) {
      res.status(200);
      return res.send(Ratings);
    });
  };
  get = function(req, res) {
    return Rating.findById(req.params.id).then(function(Ratings) {
      res.status(200);
      return res.send(Ratings);
    });
  };
  create = function(req, res) {
    return Rating.create(req.body).then(function(Rating) {
      res.status(200);
      return res.send(Rating);
    });
  };
  update = function(req, res) {
    return Rating.findById(req.params.id).then(function(Rating) {
      if (Rating == null) {
        res.status(400);
        return res.send('Rating not found');
      } else {
        _.extend(Rating, req.body);
        return Rating.save().then(function(Rating) {
          res.status(200);
          return res.send(Rating);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Rating.findById(req.params.id).then(function(Rating) {
      if (Rating == null) {
        res.status(400);
        return res.send('Rating not found');
      } else {
        return Rating.destroy().then(function(Rating) {
          res.status(200);
          return res.send(Rating);
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
