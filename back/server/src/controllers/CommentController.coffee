Promise = require 'bluebird'
_ = require 'underscore'
Comment = require '../models/Comment'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Comment.findAll filter.create req.query
      .then (Comments) ->
        res.status 200
        res.send Comments

  get = (req, res) ->
    Comment.findById req.params.id
      .then (Comments) ->
        res.status 200
        res.send Comments

  create = (req, res) ->
    Comment.create req.body
      .then (Comment) ->
        res.status 200
        res.send Comment

  update = (req, res) ->
    Comment.findById req.params.id
      .then (Comment) ->
        if not Comment?
          res.status 400
          res.send 'Comment not found'
        else
          _.extend Comment, req.body
          Comment.save()
            .then (Comment) ->
              res.status 200
              res.send Comment

  destroy = (req, res) ->
    Comment.findById req.params.id
      .then (Comment) ->
        if not Comment?
          res.status 400
          res.send 'Comment not found'
        else
          Comment.destroy()
            .then (Comment) ->
              res.status 200
              res.send Comment


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
