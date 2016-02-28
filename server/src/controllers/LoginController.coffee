###jslint unparam: true, nomen: true###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

# REQUIRES
randomstring = require('just.randomstring')
theAccountsDao = require('../dao/AccountsDao')
theMessages = require('../Messages')
theLoginHelper = require('./LoginHelper')
theCrypt = require('../Crypt')

LoginController = ->
  'use strict'

  @login = (pReq, pRes) ->
    body = undefined
    email = undefined
    password = undefined
    body = pReq.body
    email = body.email
    password = body.password
    theAccountsDao.getAccountId email, (pResults) ->
      if pResults.error
        pRes.status 400
        pRes.send pResults
        return
      theCrypt.check password, pResults.password, (err, matches) ->
        if matches
          theLoginHelper.sendToken pResults.id, pRes
        else
          pRes.status 400
          pRes.send theMessages.error('Invalid Login!')
        return
      return
    return

  return

module.exports = new LoginController
