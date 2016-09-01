jwt = require 'jsonwebtoken'

Discussion = require '../models/Discussion'

module.exports = (req, res, next) ->
  Discussion.findOne
    where:
      id: req.params.id
  .then (discussion) ->
    if not discussion?
      res.status 400
      res.send 'id was not found'
    else if discussion.accountId is req.user.id
      next()
    else
      res.status 403
      res.send 'unauthorized'
