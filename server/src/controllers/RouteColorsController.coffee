Promise = require 'bluebird'
_ = require 'underscore'
RouteColors = require '../models/RouteColors'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    RouteColors.findAll where: req.query
      .then (RouteColorss) ->
        res.status 200
        res.send RouteColorss

  get = (req, res) ->
    RouteColors.findById req.params.id
      .then (RouteColorss) ->
        res.status 200
        res.send RouteColorss

  create = (req, res) ->
    RouteColors.create req.body
      .then (RouteColors) ->
        res.status 200
        res.send RouteColors

  update = (req, res) ->
    RouteColors.findById req.params.id
      .then (RouteColors) ->
        if not RouteColors?
          res.status 400
          res.send 'RouteColors not found'
        else
          RouteColors.destroy()
            .then (RouteColors) ->
              res.status 200
              res.send RouteColors

  destroy = (req, res) ->
    RouteColors.findById req.params.id
      .then (RouteColors) ->
        if not RouteColors?
          res.status 400
          res.send 'RouteColors not found'
        else
          RouteColors.destroy()
            .then (RouteColors) ->
              res.status 200
              res.send RouteColors


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
