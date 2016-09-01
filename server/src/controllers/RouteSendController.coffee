Promise = require 'bluebird'
_ = require 'underscore'
RouteSend = require '../models/RouteSend'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    RouteSend.findAll where: req.query
      .then (RouteSends) ->
        res.status 200
        res.send RouteSends

  get = (req, res) ->
    RouteSend.findById req.params.id
      .then (RouteSends) ->
        res.status 200
        res.send RouteSends

  create = (req, res) ->
    RouteSend.create req.body
      .then (RouteSend) ->
        res.status 200
        res.send RouteSend

  update = (req, res) ->
    RouteSend.findById req.params.id
      .then (RouteSend) ->
        if not RouteSend?
          res.status 400
          res.send 'RouteSend not found'
        else
          RouteSend.destroy()
            .then (RouteSend) ->
              res.status 200
              res.send RouteSend

  destroy = (req, res) ->
    RouteSend.findById req.params.id
      .then (RouteSend) ->
        if not RouteSend?
          res.status 400
          res.send 'RouteSend not found'
        else
          RouteSend.destroy()
            .then (RouteSend) ->
              res.status 200
              res.send RouteSend


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
