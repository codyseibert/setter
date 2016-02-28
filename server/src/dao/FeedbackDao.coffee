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

FeedbackDao = ->
  'use strict'

  @createFeedback = (pName, pMessage, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO feedback (name, message) values (?, ?)', [
      pName
      pMessage
    ], theDaoHelper.INSERT, pCallback
    return

  return

module.exports = new FeedbackDao
