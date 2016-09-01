Promise = require 'bluebird'
_ = require 'underscore'
GymSuggestion = require '../models/GymSuggestion'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    GymSuggestion.findAll where: req.query
      .then (GymSuggestions) ->
        res.status 200
        res.send GymSuggestions

  get = (req, res) ->
    GymSuggestion.findById req.params.id
      .then (GymSuggestions) ->
        res.status 200
        res.send GymSuggestions

  create = (req, res) ->
    GymSuggestion.create req.body
      .then (GymSuggestion) ->
        res.status 200
        res.send GymSuggestion

  update = (req, res) ->
    GymSuggestion.findById req.params.id
      .then (GymSuggestion) ->
        if not GymSuggestion?
          res.status 400
          res.send 'GymSuggestion not found'
        else
          GymSuggestion.destroy()
            .then (GymSuggestion) ->
              res.status 200
              res.send GymSuggestion

  destroy = (req, res) ->
    GymSuggestion.findById req.params.id
      .then (GymSuggestion) ->
        if not GymSuggestion?
          res.status 400
          res.send 'GymSuggestion not found'
        else
          GymSuggestion.destroy()
            .then (GymSuggestion) ->
              res.status 200
              res.send GymSuggestion


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
