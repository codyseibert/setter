###jslint unparam: true, nomen: true###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

theCrypt = require('../Crypt')
theAccountsDao = require('../dao/AccountsDao')
randomstring = require('just.randomstring')
theMailer = require('../Mailer')
theControllerHelper = require('./ControllerHelper')

AccountsController = ->
  'use strict'

  @mailNewPassword = (pReq, pRes) ->
    accountId = undefined
    newPassword = undefined
    accountId = pReq.user.accountId
    newPassword = randomstring()
    theCrypt.crypt newPassword, (pErr, pHash) ->
      theAccountsDao.updatePassword accountId, pHash, (pErr, pResults) ->
        theMailer.mailResetPassword pReq.body.email, newPassword
        pRes.send pResults
        return
      return
    return

  @changePassword = (pReq, pRes) ->
    accountId = undefined
    newPassword = undefined
    accountId = pReq.user.accountId
    newPassword = pReq.body.password
    theCrypt.crypt newPassword, (pErr, pHash) ->
      theAccountsDao.updatePassword accountId, pHash, (pErr, pResults) ->
        pRes.send pResults
        return
      return
    return

  @getSettings = (pReq, pRes) ->
    accountId = undefined
    callback = undefined
    accountId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theAccountsDao.getSettings accountId, callback
    return

  @updateSettings = (pReq, pRes) ->
    accountId = undefined
    settings = undefined
    callback = undefined
    accountId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    settings = pReq.body
    theAccountsDao.updateSettings accountId, settings, callback
    return

  return

module.exports = new AccountsController
