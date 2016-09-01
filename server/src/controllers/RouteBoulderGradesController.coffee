Promise = require 'bluebird'
_ = require 'underscore'
RouteBoulderGrades = require '../models/RouteBoulderGrades'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    RouteBoulderGrades.findAll where: req.query
      .then (RouteBoulderGradess) ->
        res.status 200
        res.send RouteBoulderGradess

  get = (req, res) ->
    RouteBoulderGrades.findById req.params.id
      .then (RouteBoulderGradess) ->
        res.status 200
        res.send RouteBoulderGradess

  create = (req, res) ->
    RouteBoulderGrades.create req.body
      .then (RouteBoulderGrades) ->
        res.status 200
        res.send RouteBoulderGrades

  update = (req, res) ->
    RouteBoulderGrades.findById req.params.id
      .then (RouteBoulderGrades) ->
        if not RouteBoulderGrades?
          res.status 400
          res.send 'RouteBoulderGrades not found'
        else
          RouteBoulderGrades.destroy()
            .then (RouteBoulderGrades) ->
              res.status 200
              res.send RouteBoulderGrades

  destroy = (req, res) ->
    RouteBoulderGrades.findById req.params.id
      .then (RouteBoulderGrades) ->
        if not RouteBoulderGrades?
          res.status 400
          res.send 'RouteBoulderGrades not found'
        else
          RouteBoulderGrades.destroy()
            .then (RouteBoulderGrades) ->
              res.status 200
              res.send RouteBoulderGrades


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
