Promise = require 'bluebird'
_ = require 'underscore'
Route = require '../models/Route'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Route.findAll filter.create req.query
      .then (Routes) ->
        res.status 200
        res.send Routes

  get = (req, res) ->
    Route.findById req.params.id
      .then (Routes) ->
        res.status 200
        res.send Routes

  create = (req, res) ->
    Route.create req.body
      .then (Route) ->
        res.status 200
        res.send Route

  update = (req, res) ->
    Route.findById req.params.id
      .then (Route) ->
        if not Route?
          res.status 400
          res.send 'Route not found'
        else
          _.extend Route, req.body
          Route.save()
            .then (Route) ->
              res.status 200
              res.send Route

  destroy = (req, res) ->
    Route.findById req.params.id
      .then (Route) ->
        if not Route?
          res.status 400
          res.send 'Route not found'
        else
          Route.destroy()
            .then (Route) ->
              res.status 200
              res.send Route


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
