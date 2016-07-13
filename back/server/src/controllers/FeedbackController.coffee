Promise = require 'bluebird'
_ = require 'underscore'
Feedback = require '../models/Feedback'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Feedback.findAll filter.create req.query
      .then (Feedbacks) ->
        res.status 200
        res.send Feedbacks

  get = (req, res) ->
    Feedback.findById req.params.id
      .then (Feedbacks) ->
        res.status 200
        res.send Feedbacks

  create = (req, res) ->
    Feedback.create req.body
      .then (Feedback) ->
        res.status 200
        res.send Feedback

  update = (req, res) ->
    Feedback.findById req.params.id
      .then (Feedback) ->
        if not Feedback?
          res.status 400
          res.send 'Feedback not found'
        else
          _.extend Feedback, req.body
          Feedback.save()
            .then (Feedback) ->
              res.status 200
              res.send Feedback

  destroy = (req, res) ->
    Feedback.findById req.params.id
      .then (Feedback) ->
        if not Feedback?
          res.status 400
          res.send 'Feedback not found'
        else
          Feedback.destroy()
            .then (Feedback) ->
              res.status 200
              res.send Feedback


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
