Promise = require 'bluebird'
_ = require 'underscore'
RouteNewToUser = require '../models/RouteNewToUser'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    RouteNewToUser.findAll filter.create req.query
      .then (RouteNewToUsers) ->
        res.status 200
        res.send RouteNewToUsers

  get = (req, res) ->
    RouteNewToUser.findById req.params.id
      .then (RouteNewToUsers) ->
        res.status 200
        res.send RouteNewToUsers

  create = (req, res) ->
    RouteNewToUser.create req.body
      .then (RouteNewToUser) ->
        res.status 200
        res.send RouteNewToUser

  update = (req, res) ->
    RouteNewToUser.findById req.params.id
      .then (RouteNewToUser) ->
        if not RouteNewToUser?
          res.status 400
          res.send 'RouteNewToUser not found'
        else
          _.extend RouteNewToUser, req.body
          RouteNewToUser.save()
            .then (RouteNewToUser) ->
              res.status 200
              res.send RouteNewToUser

  destroy = (req, res) ->
    RouteNewToUser.findById req.params.id
      .then (RouteNewToUser) ->
        if not RouteNewToUser?
          res.status 400
          res.send 'RouteNewToUser not found'
        else
          RouteNewToUser.destroy()
            .then (RouteNewToUser) ->
              res.status 200
              res.send RouteNewToUser


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
