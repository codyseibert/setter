Promise = require 'bluebird'
_ = require 'underscore'
Account = require '../models/Account'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Account.findAll filter.create req.query
      .then (Accounts) ->
        res.status 200
        res.send Accounts

  get = (req, res) ->
    Account.findById req.params.id
      .then (Accounts) ->
        res.status 200
        res.send Accounts

  create = (req, res) ->
    Account.create req.body
      .then (Account) ->
        res.status 200
        res.send Account

  update = (req, res) ->
    Account.findById req.params.id
      .then (Account) ->
        if not Account?
          res.status 400
          res.send 'Account not found'
        else
          _.extend Account, req.body
          Account.save()
            .then (Account) ->
              res.status 200
              res.send Account

  destroy = (req, res) ->
    Account.findById req.params.id
      .then (Account) ->
        if not Account?
          res.status 400
          res.send 'Account not found'
        else
          Account.destroy()
            .then (Account) ->
              res.status 200
              res.send Account


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
