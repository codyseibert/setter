module.exports = (req, res, next) ->
  if "#{req.user.id}" in [req.params.gymId, req.body.gymId]
    next()
  else
    res.status 403
    res.send 'unauthorized'
