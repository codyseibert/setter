Promise = require 'bluebird'
_ = require 'underscore'
Setter = require '../models/Setter'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Setter.findAll filter.create req.query
      .then (Setters) ->
        res.status 200
        res.send Setters

  get = (req, res) ->
    Setter.findById req.params.id
      .then (Setters) ->
        res.status 200
        res.send Setters

  create = (req, res) ->
    Setter.create req.body
      .then (Setter) ->
        res.status 200
        res.send Setter

  update = (req, res) ->
    Setter.findById req.params.id
      .then (Setter) ->
        if not Setter?
          res.status 400
          res.send 'Setter not found'
        else
          _.extend Setter, req.body
          Setter.save()
            .then (Setter) ->
              res.status 200
              res.send Setter

  destroy = (req, res) ->
    Setter.findById req.params.id
      .then (Setter) ->
        if not Setter?
          res.status 400
          res.send 'Setter not found'
        else
          Setter.destroy()
            .then (Setter) ->
              res.status 200
              res.send Setter


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
