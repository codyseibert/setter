Promise = require 'bluebird'
_ = require 'underscore'
User = require '../models/User'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    User.findAll filter.create req.query
      .then (Users) ->
        res.status 200
        res.send Users

  get = (req, res) ->
    User.findById req.params.id
      .then (Users) ->
        res.status 200
        res.send Users

  create = (req, res) ->
    User.create req.body
      .then (User) ->
        res.status 200
        res.send User

  update = (req, res) ->
    User.findById req.params.id
      .then (User) ->
        if not User?
          res.status 400
          res.send 'User not found'
        else
          _.extend User, req.body
          User.save()
            .then (User) ->
              res.status 200
              res.send User

  destroy = (req, res) ->
    User.findById req.params.id
      .then (User) ->
        if not User?
          res.status 400
          res.send 'User not found'
        else
          User.destroy()
            .then (User) ->
              res.status 200
              res.send User


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
