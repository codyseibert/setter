Promise = require 'bluebird'
_ = require 'underscore'
RouteRating = require '../models/RouteRating'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    RouteRating.findAll where: req.query
      .then (RouteRatings) ->
        res.status 200
        res.send RouteRatings

  get = (req, res) ->
    RouteRating.findById req.params.id
      .then (RouteRatings) ->
        res.status 200
        res.send RouteRatings

  create = (req, res) ->
    RouteRating.create req.body
      .then (RouteRating) ->
        res.status 200
        res.send RouteRating

  update = (req, res) ->
    RouteRating.findById req.params.id
      .then (RouteRating) ->
        if not RouteRating?
          res.status 400
          res.send 'RouteRating not found'
        else
          RouteRating.destroy()
            .then (RouteRating) ->
              res.status 200
              res.send RouteRating

  destroy = (req, res) ->
    RouteRating.findById req.params.id
      .then (RouteRating) ->
        if not RouteRating?
          res.status 400
          res.send 'RouteRating not found'
        else
          RouteRating.destroy()
            .then (RouteRating) ->
              res.status 200
              res.send RouteRating


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
