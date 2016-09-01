jwt = require 'jsonwebtoken'

module.exports = (req, res, next) ->
  if not req.headers.authorization?
    res.status 403
    res.send 'token not in header'
    return

  try
    req.user = jwt.verify req.headers.authorization, process.env.JWT_SECRET
    next()
  catch err
    res.status 403
    res.send 'token validation failed'
