Promise = require 'bluebird'
_ = require 'underscore'
Gym = require '../models/Gym'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Gym.findAll filter.create req.query
      .then (Gyms) ->
        res.status 200
        res.send Gyms

  get = (req, res) ->
    Gym.findById req.params.id
      .then (Gyms) ->
        res.status 200
        res.send Gyms

  create = (req, res) ->
    endOn = new Date();
    endOn.setDate endOn.getDate() + 30
    req.body.trialEndsOn = endOn
    req.body.active = false
    Gym.create req.body
      .then (Gym) ->
        res.status 200
        res.send Gym

  update = (req, res) ->
    Gym.findById req.params.id
      .then (Gym) ->
        if not Gym?
          res.status 400
          res.send 'Gym not found'
        else
          _.extend Gym, req.body
          Gym.save()
            .then (Gym) ->
              res.status 200
              res.send Gym

  destroy = (req, res) ->
    Gym.findById req.params.id
      .then (Gym) ->
        if not Gym?
          res.status 400
          res.send 'Gym not found'
        else
          Gym.destroy()
            .then (Gym) ->
              res.status 200
              res.send Gym


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
