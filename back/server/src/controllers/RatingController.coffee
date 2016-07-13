Promise = require 'bluebird'
_ = require 'underscore'
Rating = require '../models/Rating'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Rating.findAll filter.create req.query
      .then (Ratings) ->
        res.status 200
        res.send Ratings

  get = (req, res) ->
    Rating.findById req.params.id
      .then (Ratings) ->
        res.status 200
        res.send Ratings

  create = (req, res) ->
    Rating.create req.body
      .then (Rating) ->
        res.status 200
        res.send Rating

  update = (req, res) ->
    Rating.findById req.params.id
      .then (Rating) ->
        if not Rating?
          res.status 400
          res.send 'Rating not found'
        else
          _.extend Rating, req.body
          Rating.save()
            .then (Rating) ->
              res.status 200
              res.send Rating

  destroy = (req, res) ->
    Rating.findById req.params.id
      .then (Rating) ->
        if not Rating?
          res.status 400
          res.send 'Rating not found'
        else
          Rating.destroy()
            .then (Rating) ->
              res.status 200
              res.send Rating


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
