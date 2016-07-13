Promise = require 'bluebird'
_ = require 'underscore'
Color = require '../models/Color'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Color.findAll filter.create req.query
      .then (Colors) ->
        res.status 200
        res.send Colors

  get = (req, res) ->
    Color.findById req.params.id
      .then (Colors) ->
        res.status 200
        res.send Colors

  create = (req, res) ->
    Color.create req.body
      .then (Color) ->
        res.status 200
        res.send Color

  update = (req, res) ->
    Color.findById req.params.id
      .then (Color) ->
        if not Color?
          res.status 400
          res.send 'Color not found'
        else
          _.extend Color, req.body
          Color.save()
            .then (Color) ->
              res.status 200
              res.send Color

  destroy = (req, res) ->
    Color.findById req.params.id
      .then (Color) ->
        if not Color?
          res.status 400
          res.send 'Color not found'
        else
          Color.destroy()
            .then (Color) ->
              res.status 200
              res.send Color


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
