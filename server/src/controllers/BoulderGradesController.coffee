Promise = require 'bluebird'
_ = require 'underscore'
BoulderGrades = require '../models/BoulderGrades'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    BoulderGrades.findAll filter.create req.query
      .then (BoulderGradess) ->
        res.status 200
        res.send BoulderGradess

  get = (req, res) ->
    BoulderGrades.findById req.params.id
      .then (BoulderGradess) ->
        res.status 200
        res.send BoulderGradess

  create = (req, res) ->
    BoulderGrades.create req.body
      .then (BoulderGrades) ->
        res.status 200
        res.send BoulderGrades

  update = (req, res) ->
    BoulderGrades.findById req.params.id
      .then (BoulderGrades) ->
        if not BoulderGrades?
          res.status 400
          res.send 'BoulderGrades not found'
        else
          _.extend BoulderGrades, req.body
          BoulderGrades.save()
            .then (BoulderGrades) ->
              res.status 200
              res.send BoulderGrades

  destroy = (req, res) ->
    BoulderGrades.findById req.params.id
      .then (BoulderGrades) ->
        if not BoulderGrades?
          res.status 400
          res.send 'BoulderGrades not found'
        else
          BoulderGrades.destroy()
            .then (BoulderGrades) ->
              res.status 200
              res.send BoulderGrades


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
