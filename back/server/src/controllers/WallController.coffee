Promise = require 'bluebird'
_ = require 'underscore'
Wall = require '../models/Wall'
filter = require '../helpers/filter'

module.exports = do ->

  find = (req, res) ->
    Wall.findAll where: req.query
      .then (Walls) ->
        res.status 200
        res.send Walls

  get = (req, res) ->
    Wall.findById req.params.id
      .then (Walls) ->
        res.status 200
        res.send Walls

  create = (req, res) ->
    Wall.create req.body
      .then (Wall) ->
        res.status 200
        res.send Wall

  update = (req, res) ->
    Wall.findById req.params.id
      .then (Wall) ->
        if not Wall?
          res.status 400
          res.send 'Wall not found'
        else
          Wall.destroy()
            .then (Wall) ->
              res.status 200
              res.send Wall

  destroy = (req, res) ->
    Wall.findById req.params.id
      .then (Wall) ->
        if not Wall?
          res.status 400
          res.send 'Wall not found'
        else
          Wall.destroy()
            .then (Wall) ->
              res.status 200
              res.send Wall


  find: find
  get: get
  create: create
  update: update
  destroy: destroy
