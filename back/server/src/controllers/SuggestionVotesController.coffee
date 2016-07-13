Promise = require 'bluebird'
_ = require 'underscore'
SuggestionVotes = require '../models/SuggestionVotes'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    SuggestionVotes.findAll where: req.query
      .then (SuggestionVotess) ->
        res.status 200
        res.send SuggestionVotess

  get = (req, res) ->
    SuggestionVotes.findById req.params.id
      .then (SuggestionVotess) ->
        res.status 200
        res.send SuggestionVotess

  create = (req, res) ->
    SuggestionVotes.create req.body
      .then (SuggestionVotes) ->
        res.status 200
        res.send SuggestionVotes

  update = (req, res) ->
    SuggestionVotes.findById req.params.id
      .then (SuggestionVotes) ->
        if not SuggestionVotes?
          res.status 400
          res.send 'SuggestionVotes not found'
        else
          SuggestionVotes.destroy()
            .then (SuggestionVotes) ->
              res.status 200
              res.send SuggestionVotes

  destroy = (req, res) ->
    SuggestionVotes.findById req.params.id
      .then (SuggestionVotes) ->
        if not SuggestionVotes?
          res.status 400
          res.send 'SuggestionVotes not found'
        else
          SuggestionVotes.destroy()
            .then (SuggestionVotes) ->
              res.status 200
              res.send SuggestionVotes


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
