Promise = require 'bluebird'
_ = require 'underscore'
RopeGrades = require '../models/RopeGrades'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    RopeGrades.findAll filter.create req.query
      .then (RopeGradess) ->
        res.status 200
        res.send RopeGradess

  get = (req, res) ->
    RopeGrades.findById req.params.id
      .then (RopeGradess) ->
        res.status 200
        res.send RopeGradess

  create = (req, res) ->
    RopeGrades.create req.body
      .then (RopeGrades) ->
        res.status 200
        res.send RopeGrades

  update = (req, res) ->
    RopeGrades.findById req.params.id
      .then (RopeGrades) ->
        if not RopeGrades?
          res.status 400
          res.send 'RopeGrades not found'
        else
          _.extend RopeGrades, req.body
          RopeGrades.save()
            .then (RopeGrades) ->
              res.status 200
              res.send RopeGrades

  destroy = (req, res) ->
    RopeGrades.findById req.params.id
      .then (RopeGrades) ->
        if not RopeGrades?
          res.status 400
          res.send 'RopeGrades not found'
        else
          RopeGrades.destroy()
            .then (RopeGrades) ->
              res.status 200
              res.send RopeGrades


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
