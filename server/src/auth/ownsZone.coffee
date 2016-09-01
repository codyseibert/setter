jwt = require 'jsonwebtoken'

Zone = require '../models/Zone'

module.exports = (req, res, next) ->
  Zone.findOne
    where:
      id: req.params.id
  .then (zone) ->
    if not zone?
      res.status 400
      res.send 'id for zone was not found'
    else if zone.gymId is req.user.id
      next()
    else
      res.status 403
      res.send 'unauthorized'
