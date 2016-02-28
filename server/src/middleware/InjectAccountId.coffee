theAccountsDao = require('../dao/AccountsDao')
theMessages = require('../Messages')

InjectAccountId = (pReq, pRes, next) ->
  'use strict'
  if !pReq.headers.authorization and !pReq.body.authorization
    pRes.status 400
    pRes.send theMessages.error('Bearer token not found in request!')
    return
  headers = undefined
  split = undefined
  token = undefined
  headers = pReq.headers.authorization or pReq.body.authorization
  split = headers.split(' ')
  if split.length <= 1
    pRes.status 400
    pRes.send theMessages.error('Bearer token has invalid format!')
    return
  token = split[1]
  theAccountsDao.getAccountIdViaToken token, (pAccountId) ->
    if pAccountId.error
      pRes.status 400
      pRes.send theMessages.error('Invalid Bearer Token!')
      return
    pReq.user = accountId: pAccountId.id
    next()
  return

module.exports = InjectAccountId
