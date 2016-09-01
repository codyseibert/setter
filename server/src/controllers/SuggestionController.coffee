Promise = require 'bluebird'
_ = require 'underscore'
Suggestion = require '../models/Suggestion'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Suggestion.findAll filter.create req.query
      .then (Suggestions) ->
        res.status 200
        res.send Suggestions

  get = (req, res) ->
    Suggestion.findById req.params.id
      .then (Suggestions) ->
        res.status 200
        res.send Suggestions

  create = (req, res) ->
    Suggestion.create req.body
      .then (Suggestion) ->
        res.status 200
        res.send Suggestion

  update = (req, res) ->
    Suggestion.findById req.params.id
      .then (Suggestion) ->
        if not Suggestion?
          res.status 400
          res.send 'Suggestion not found'
        else
          _.extend Suggestion, req.body
          Suggestion.save()
            .then (Suggestion) ->
              res.status 200
              res.send Suggestion

  destroy = (req, res) ->
    Suggestion.findById req.params.id
      .then (Suggestion) ->
        if not Suggestion?
          res.status 400
          res.send 'Suggestion not found'
        else
          Suggestion.destroy()
            .then (Suggestion) ->
              res.status 200
              res.send Suggestion


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
