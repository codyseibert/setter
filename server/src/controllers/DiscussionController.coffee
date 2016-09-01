Promise = require 'bluebird'
_ = require 'underscore'
Discussion = require '../models/Discussion'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Discussion.findAll filter.create req.query
      .then (discussions) ->
        res.status 200
        res.send discussions

  get = (req, res) ->
    Discussion.findById req.params.id
      .then (discussion) ->
        res.status 200
        res.send discussion

  create = (req, res) ->
    Discussion.create req.body
      .then (discussion) ->
        res.status 200
        res.send discussion

  update = (req, res) ->
    Discussion.update req.body,
      where:
        id: req.params.id
    .then ->
      res.status 200
      res.send req.body

  destroy = (req, res) ->
    Discussion.destroy
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
