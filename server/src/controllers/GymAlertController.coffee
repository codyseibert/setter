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
    GymAlert.update req.body,
      where:
        id: req.params.id
    .then ->
      res.status 200
      res.send req.body

  destroy = (req, res) ->
    GymAlert.destroy
      where:
        id: req.params.id
    .then ->
      res.status 200
      res.send 'success'

  find: find
  get: get
  create: create
  update: update
  destroy: destroy
