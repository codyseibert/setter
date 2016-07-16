Promise = require 'bluebird'
_ = require 'underscore'
jwt = require 'jsonwebtoken'
Gym = require '../models/Gym'


module.exports = do ->

  login = (req, res) ->
    Gym.findOne
      where:
        email: req.body.email
        password: req.body.password
    .then (gym) ->
      if gym?
        token = jwt.sign gym.toJSON(), process.env.JWT_SECRET
        res.status 200
        res.send token
      else
        res.status 403
        res.send 'invalid login information'

  login: login
