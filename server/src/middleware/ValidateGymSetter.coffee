theAccountsDao = require('../dao/AccountsDao')
theSettersDao = require('../dao/SettersDao')
theMessages = require('../Messages')

###*
    Always call InjectAccountId in the Routes.js before
    invoking this middleware!
###

ValidateGymSetter = (pReq, pRes, next) ->
  'use strict'
  gymId = parseInt(pReq.params.gymId, 10)
  userId = pReq.user.accountId
  theAccountsDao.getGymAccessList userId, (data) ->
    data = data.map((gym) ->
      gym.account_id
    )
    if gymId == pReq.user.accountId or data.indexOf(gymId) >= 0
      next()
    else
      pRes.status 400
      pRes.send theMessages.error('You are not authorized for this route!')
      return
    return
  return

module.exports = ValidateGymSetter
