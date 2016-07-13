Promise = require 'bluebird'
_ = require 'underscore'
RouteComment = require '../models/RouteComment'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    RouteComment.findAll where: req.query
      .then (RouteComments) ->
        res.status 200
        res.send RouteComments

  get = (req, res) ->
    RouteComment.findById req.params.id
      .then (RouteComments) ->
        res.status 200
        res.send RouteComments

  create = (req, res) ->
    RouteComment.create req.body
      .then (RouteComment) ->
        res.status 200
        res.send RouteComment

  update = (req, res) ->
    RouteComment.findById req.params.id
      .then (RouteComment) ->
        if not RouteComment?
          res.status 400
          res.send 'RouteComment not found'
        else
          RouteComment.destroy()
            .then (RouteComment) ->
              res.status 200
              res.send RouteComment

  destroy = (req, res) ->
    RouteComment.findById req.params.id
      .then (RouteComment) ->
        if not RouteComment?
          res.status 400
          res.send 'RouteComment not found'
        else
          RouteComment.destroy()
            .then (RouteComment) ->
              res.status 200
              res.send RouteComment


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
