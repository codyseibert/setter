Promise = require 'bluebird'
_ = require 'underscore'
FeedbackVote = require '../models/FeedbackVote'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    FeedbackVote.findAll filter.create req.query
      .then (FeedbackVotes) ->
        res.status 200
        res.send FeedbackVotes

  get = (req, res) ->
    FeedbackVote.findById req.params.id
      .then (FeedbackVotes) ->
        res.status 200
        res.send FeedbackVotes

  create = (req, res) ->
    FeedbackVote.create req.body
      .then (FeedbackVote) ->
        res.status 200
        res.send FeedbackVote

  update = (req, res) ->
    FeedbackVote.findById req.params.id
      .then (FeedbackVote) ->
        if not FeedbackVote?
          res.status 400
          res.send 'FeedbackVote not found'
        else
          _.extend FeedbackVote, req.body
          FeedbackVote.save()
            .then (FeedbackVote) ->
              res.status 200
              res.send FeedbackVote

  destroy = (req, res) ->
    FeedbackVote.findById req.params.id
      .then (FeedbackVote) ->
        if not FeedbackVote?
          res.status 400
          res.send 'FeedbackVote not found'
        else
          FeedbackVote.destroy()
            .then (FeedbackVote) ->
              res.status 200
              res.send FeedbackVote


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
