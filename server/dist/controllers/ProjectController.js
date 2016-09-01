var Project, Promise, _, filter;

Promise = require('bluebird');

_ = require('underscore');

Project = require('../models/Project');

filter = require('../helpers/filter');

module.exports = (function() {
  var create, destroy, find, get, update;
  find = function(req, res) {
    return Project.findAll(filter.create(req.query)).then(function(Projects) {
      res.status(200);
      return res.send(Projects);
    });
  };
  get = function(req, res) {
    return Project.findById(req.params.id).then(function(Projects) {
      res.status(200);
      return res.send(Projects);
    });
  };
  create = function(req, res) {
    return Project.create(req.body).then(function(Project) {
      res.status(200);
      return res.send(Project);
    });
  };
  update = function(req, res) {
    return Project.findById(req.params.id).then(function(Project) {
      if (Project == null) {
        res.status(400);
        return res.send('Project not found');
      } else {
        _.extend(Project, req.body);
        return Project.save().then(function(Project) {
          res.status(200);
          return res.send(Project);
        });
      }
    });
  };
  destroy = function(req, res) {
    return Project.findById(req.params.id).then(function(Project) {
      if (Project == null) {
        res.status(400);
        return res.send('Project not found');
      } else {
        return Project.destroy().then(function(Project) {
          res.status(200);
          return res.send(Project);
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
