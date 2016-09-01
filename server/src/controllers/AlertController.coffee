Promise = require 'bluebird'
_ = require 'underscore'
Alert = require '../models/Alert'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Alert.findAll filter.create req.query
      .then (Alerts) ->
        res.status 200
        res.send Alerts

  get = (req, res) ->
    Alert.findById req.params.id
      .then (Alerts) ->
        res.status 200
        res.send Alerts

  create = (req, res) ->
    Alert.create req.body
      .then (Alert) ->
        res.status 200
        res.send Alert

  update = (req, res) ->
    Alert.findById req.params.id
      .then (Alert) ->
        if not Alert?
          res.status 400
          res.send 'Alert not found'
        else
          _.extend Alert, req.body
          Alert.save()
            .then (Alert) ->
              res.status 200
              res.send Alert

  destroy = (req, res) ->
    Alert.findById req.params.id
      .then (Alert) ->
        if not Alert?
          res.status 400
          res.send 'Alert not found'
        else
          Alert.destroy()
            .then (Alert) ->
              res.status 200
              res.send Alert


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
