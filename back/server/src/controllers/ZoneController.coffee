Promise = require 'bluebird'
_ = require 'underscore'
Zone = require '../models/Zone'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Zone.findAll filter.create req.query
      .then (Zones) ->
        res.status 200
        res.send Zones

  get = (req, res) ->
    Zone.findById req.params.id
      .then (Zones) ->
        res.status 200
        res.send Zones

  create = (req, res) ->
    Zone.create req.body
      .then (Zone) ->
        res.status 200
        res.send Zone

  update = (req, res) ->
    Zone.findById req.params.id
      .then (Zone) ->
        if not Zone?
          res.status 400
          res.send 'Zone not found'
        else
          _.extend Zone, req.body
          Zone.save()
            .then (Zone) ->
              res.status 200
              res.send Zone

  destroy = (req, res) ->
    Zone.findById req.params.id
      .then (Zone) ->
        if not Zone?
          res.status 400
          res.send 'Zone not found'
        else
          Zone.destroy()
            .then (Zone) ->
              res.status 200
              res.send Zone


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
