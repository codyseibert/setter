Promise = require 'bluebird'
_ = require 'underscore'
GymAlert = require '../models/GymAlert'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    GymAlert.findAll where: req.query
      .then (GymAlerts) ->
        res.status 200
        res.send GymAlerts

  get = (req, res) ->
    GymAlert.findById req.params.id
      .then (GymAlerts) ->
        res.status 200
        res.send GymAlerts

  create = (req, res) ->
    GymAlert.create req.body
      .then (GymAlert) ->
        res.status 200
        res.send GymAlert

  update = (req, res) ->
    GymAlert.findById req.params.id
      .then (GymAlert) ->
        if not GymAlert?
          res.status 400
          res.send 'GymAlert not found'
        else
          GymAlert.destroy()
            .then (GymAlert) ->
              res.status 200
              res.send GymAlert

  destroy = (req, res) ->
    GymAlert.findById req.params.id
      .then (GymAlert) ->
        if not GymAlert?
          res.status 400
          res.send 'GymAlert not found'
        else
          GymAlert.destroy()
            .then (GymAlert) ->
              res.status 200
              res.send GymAlert


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
