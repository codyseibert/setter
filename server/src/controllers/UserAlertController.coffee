Promise = require 'bluebird'
_ = require 'underscore'
UserAlert = require '../models/UserAlert'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    UserAlert.findAll where: req.query
      .then (UserAlerts) ->
        res.status 200
        res.send UserAlerts

  get = (req, res) ->
    UserAlert.findById req.params.id
      .then (UserAlerts) ->
        res.status 200
        res.send UserAlerts

  create = (req, res) ->
    UserAlert.create req.body
      .then (UserAlert) ->
        res.status 200
        res.send UserAlert

  update = (req, res) ->
    UserAlert.findById req.params.id
      .then (UserAlert) ->
        if not UserAlert?
          res.status 400
          res.send 'UserAlert not found'
        else
          UserAlert.destroy()
            .then (UserAlert) ->
              res.status 200
              res.send UserAlert

  destroy = (req, res) ->
    UserAlert.findById req.params.id
      .then (UserAlert) ->
        if not UserAlert?
          res.status 400
          res.send 'UserAlert not found'
        else
          UserAlert.destroy()
            .then (UserAlert) ->
              res.status 200
              res.send UserAlert


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
