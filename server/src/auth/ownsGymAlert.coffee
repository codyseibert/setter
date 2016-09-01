jwt = require 'jsonwebtoken'

GymAlert = require '../models/GymAlert'

module.exports = (req, res, next) ->
  GymAlert.findOne
    where:
      id: req.params.id
  .then (alert) ->
    if not alert?
      res.status 400
      res.send 'id was not found'
    else if alert.gymId is req.user.id
      next()
    else
      res.status 403
      res.send 'unauthorized'
