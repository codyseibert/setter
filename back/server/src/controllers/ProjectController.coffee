Promise = require 'bluebird'
_ = require 'underscore'
Project = require '../models/Project'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Project.findAll filter.create req.query
      .then (Projects) ->
        res.status 200
        res.send Projects

  get = (req, res) ->
    Project.findById req.params.id
      .then (Projects) ->
        res.status 200
        res.send Projects

  create = (req, res) ->
    Project.create req.body
      .then (Project) ->
        res.status 200
        res.send Project

  update = (req, res) ->
    Project.findById req.params.id
      .then (Project) ->
        if not Project?
          res.status 400
          res.send 'Project not found'
        else
          _.extend Project, req.body
          Project.save()
            .then (Project) ->
              res.status 200
              res.send Project

  destroy = (req, res) ->
    Project.findById req.params.id
      .then (Project) ->
        if not Project?
          res.status 400
          res.send 'Project not found'
        else
          Project.destroy()
            .then (Project) ->
              res.status 200
              res.send Project


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
