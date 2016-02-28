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

AlertsDao = ->
  'use strict'

  @getAlertsForGym = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT id, message, date FROM alerts WHERE gym_id = ? ORDER BY date DESC LIMIT 5', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @createAlert = (pGymId, pMessage, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO alerts (gym_id, message, date) VALUES (?, ?, NOW())', [
      pGymId
      pMessage
    ], theDaoHelper.INSERT, (pAlert) ->
      theDaoHelper.executeQuery 'SELECT * FROM users WHERE gym_id = ?', [ pGymId ], theDaoHelper.MULTIPLE, (pUsers) ->
        i = 0
        while i < pUsers.length
          user = pUsers[i]
          theDaoHelper.executeQuery 'INSERT INTO alerts_users (user_id, alert_id) VALUES (?, ?)', [
            user.account_id
            pAlert.id
          ], theDaoHelper.INSERT, ->
          i++
        return
      pCallback pAlert
      return
    return

  @deleteAlert = (pAlertId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM alerts WHERE id = ?', [ pAlertId ], theDaoHelper.DELETE, pCallback
    return

  @getAlertsForUser = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT a.message, a.date FROM alerts_users au ' + 'INNER JOIN alerts a ON au.alert_id = a.id ' + 'WHERE au.user_id = ?', [ pUserId ], theDaoHelper.MULTIPLE, (pData) ->
      theDaoHelper.executeQuery 'DELETE FROM alerts_users WHERE user_id = ?', [ pUserId ], theDaoHelper.DELETE, ->
      pCallback pData
      return
    return

  return

module.exports = new AlertsDao
