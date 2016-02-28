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

###*
*   Logic for all account requests
*
*   @Author Cody Seibert
*   @Date 12/7/2014
###

LoginHelper = ->
  'use strict'

  @sendToken = (pAccountId, pRes) ->
    theAccountsDao.getAccountInfo pAccountId, (pResults) ->
      if pResults.error
        pRes.status 400
        pRes.send theMessages.ERROR
        return
      pRes.send
        token: pResults.token
        email: pResults.email
        accountType: pResults.type_id
        accountId: pAccountId
        homeGymId: pResults.gym_id
        gymName: pResults.name
        url: pResults.url
        fullname: pResults.fullname
        gyms: pResults.gyms
      return
    return

  @generateAndSendToken = (pAccountId, pRes) ->
    token = randomstring(20)
    that = this
    theAccountsDao.setToken pAccountId, token, (pResults) ->
      if pResults.error
        pRes.status 400
        pRes.send theMessages.ERROR
        return
      that.sendToken pAccountId, pRes
      return
    return

  return

module.exports = new LoginHelper
