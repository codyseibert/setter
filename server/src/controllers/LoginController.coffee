Promise = require 'bluebird'
_ = require 'underscore'
jwt = require 'jsonwebtoken'
Gym = require '../models/Gym'
Account = require '../models/Account'


module.exports = do ->

  login = (req, res) ->
    Gym.findOne
      where:
        email: req.body.email
        password: req.body.password
    .then (gym) ->
      if gym?
        gym = gym.toJSON()
        gym.isGymAccount = true
        token = jwt.sign gym, process.env.JWT_SECRET
        res.status 200
        res.send token
      else
        Account.findOne
          where:
            email: req.body.email
            password: req.body.password
        .then (account) ->
          if account?
            token = jwt.sign account.toJSON(), process.env.JWT_SECRET
            res.status 200
            res.send token
          else
            res.status 403
            res.send 'invalid login information'

  login: login
