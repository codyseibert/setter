###jslint nomen: true ###

###
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
###

theDB = require('../DBConnection')
theMessages = require('../Messages')
theDaoHelper = require('./DaoHelper')

GymAccountsRequestsDao = ->
  'use strict'

  @createGymAccountRequest = (pEmail, pName, pAddress, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO gym_account_requests (email, name, address) VALUES (?, ?, ?)', [
      pEmail
      pName
      pAddress
    ], theDaoHelper.INSERT, pCallback
    return

  return

module.exports = new GymAccountsRequestsDao
