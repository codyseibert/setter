theAccountsDao = require('../dao/AccountsDao')
theMessages = require('../Messages')

InjectAccountIdUsingEmail = (pReq, pRes, next) ->
  'use strict'
  email = pReq.body.email
  theAccountsDao.getAccountIdUsingEmail email, (pResults) ->
    if pResults.error
      pRes.status 400
      pRes.send theMessages.error('No user found with that email')
      return
    pReq.user = accountId: pResults.id
    next()
  return

module.exports = InjectAccountIdUsingEmail
