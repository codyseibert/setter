Promise = require 'bluebird'
_ = require 'underscore'
Send = require '../models/Send'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Send.findAll filter.create req.query
      .then (Sends) ->
        res.status 200
        res.send Sends

  get = (req, res) ->
    Send.findById req.params.id
      .then (Sends) ->
        res.status 200
        res.send Sends

  create = (req, res) ->
    Send.create req.body
      .then (Send) ->
        res.status 200
        res.send Send

  update = (req, res) ->
    Send.findById req.params.id
      .then (Send) ->
        if not Send?
          res.status 400
          res.send 'Send not found'
        else
          _.extend Send, req.body
          Send.save()
            .then (Send) ->
              res.status 200
              res.send Send

  destroy = (req, res) ->
    Send.findById req.params.id
      .then (Send) ->
        if not Send?
          res.status 400
          res.send 'Send not found'
        else
          Send.destroy()
            .then (Send) ->
              res.status 200
              res.send Send


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
