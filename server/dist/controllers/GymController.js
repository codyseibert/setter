var Gym, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Gym = require('../models/Gym');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Gym.findAll(filter.create(req.query)).then(function(Gyms) {
      res.status(200);
      return res.send(Gyms);
    });
  };
  get = function(req, res) {
    return Gym.findById(req.params.id).then(function(Gyms) {
      res.status(200);
      return res.send(Gyms);
    });
  };
  create = function(req, res) {
    var endOn;
    endOn = new Date();
    endOn.setDate(endOn.getDate() + 30);
    req.body.trialEndsOn = endOn;
    req.body.active = false;
    return Gym.create(req.body).then(function(Gym) {
      res.status(200);
      return res.send(Gym);
    });
  };
  update = function(req, res) {
    console.log('update called');
    return Gym.update(req.body, {
      where: {
        id: req.params.id
      }
    }).then(function() {
      res.status(200);
      return res.send(req.body);
    });
  };
  destroy = function(req, res) {
    return Gym.findById(req.params.id).then(function(Gym) {
      if (Gym == null) {
        res.status(400);
        return res.send('Gym not found');
      } else {
        return Gym.destroy().then(function(Gym) {
          res.status(200);
          return res.send(Gym);
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
