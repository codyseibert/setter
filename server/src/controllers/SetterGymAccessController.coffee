Promise = require 'bluebird'
_ = require 'underscore'
SetterGymAccess = require '../models/SetterGymAccess'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    SetterGymAccess.findAll where: req.query
      .then (SetterGymAccesss) ->
        res.status 200
        res.send SetterGymAccesss

  get = (req, res) ->
    SetterGymAccess.findById req.params.id
      .then (SetterGymAccesss) ->
        res.status 200
        res.send SetterGymAccesss

  create = (req, res) ->
    SetterGymAccess.create req.body
      .then (SetterGymAccess) ->
        res.status 200
        res.send SetterGymAccess

  update = (req, res) ->
    SetterGymAccess.findById req.params.id
      .then (SetterGymAccess) ->
        if not SetterGymAccess?
          res.status 400
          res.send 'SetterGymAccess not found'
        else
          SetterGymAccess.destroy()
            .then (SetterGymAccess) ->
              res.status 200
              res.send SetterGymAccess

  destroy = (req, res) ->
    SetterGymAccess.findById req.params.id
      .then (SetterGymAccess) ->
        if not SetterGymAccess?
          res.status 400
          res.send 'SetterGymAccess not found'
        else
          SetterGymAccess.destroy()
            .then (SetterGymAccess) ->
              res.status 200
              res.send SetterGymAccess


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
