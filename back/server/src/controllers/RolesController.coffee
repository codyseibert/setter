Promise = require 'bluebird'
_ = require 'underscore'
Roles = require '../models/Roles'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Roles.findAll filter.create req.query
      .then (Roless) ->
        res.status 200
        res.send Roless

  get = (req, res) ->
    Roles.findById req.params.id
      .then (Roless) ->
        res.status 200
        res.send Roless

  create = (req, res) ->
    Roles.create req.body
      .then (Roles) ->
        res.status 200
        res.send Roles

  update = (req, res) ->
    Roles.findById req.params.id
      .then (Roles) ->
        if not Roles?
          res.status 400
          res.send 'Roles not found'
        else
          _.extend Roles, req.body
          Roles.save()
            .then (Roles) ->
              res.status 200
              res.send Roles

  destroy = (req, res) ->
    Roles.findById req.params.id
      .then (Roles) ->
        if not Roles?
          res.status 400
          res.send 'Roles not found'
        else
          Roles.destroy()
            .then (Roles) ->
              res.status 200
              res.send Roles


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
