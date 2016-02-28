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

ProgressionsDao = ->
  'use strict'

  @refreshProgressions = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO progressions (user_id, bouldering_grade, toprope_grade, lead_grade, date) VALUES (?, ' + '(SELECT bouldering_grade FROM users WHERE account_id = ?), ' + '(SELECT toprope_grade FROM users WHERE account_id = ?), ' + '(SELECT lead_grade FROM users WHERE account_id = ?), ' + 'DATE_FORMAT(NOW(), \'%Y-%m-01\')) ON DUPLICATE KEY UPDATE ' + 'bouldering_grade = (SELECT bouldering_grade FROM users WHERE account_id = ?), ' + 'toprope_grade = (SELECT toprope_grade FROM users WHERE account_id = ?), ' + 'lead_grade = (SELECT lead_grade FROM users WHERE account_id = ?)', [
      pUserId
      pUserId
      pUserId
      pUserId
      pUserId
      pUserId
      pUserId
    ], theDaoHelper.INSERT, pCallback
    return

  @getProgressions = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT date, bouldering_grade, toprope_grade, lead_grade FROM progressions WHERE user_id = ? ORDER BY date ASC', [ pUserId ], theDaoHelper.MULTIPLE, pCallback
    return

  return

module.exports = new ProgressionsDao
