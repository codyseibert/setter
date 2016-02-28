theAccountsDao = require('../dao/AccountsDao')
theMessages = require('../Messages')

###*
    Always call InjectAccountId in the Routes.js before
    invoking this middleware!
###

ValidateGymAdmin = (pReq, pRes, next) ->
  'use strict'
  gymId = parseInt(pReq.params.gymId, 10)
  # TODO:
  # in the future do query against database to check if the userId is a
  # valid setter once we start adding that functionality in.
  if gymId != pReq.user.accountId
    pRes.status 400
    pRes.send theMessages.error('You are not authorized for this route!')
    return
  next()
  return

module.exports = ValidateGymAdmin
