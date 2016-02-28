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

###*
AccountsDao

Used for accessing any information related to the accounts.
###

ColorsDao = ->
  'use strict'

  ###*
      Retreieves the boulder grades from the database.

      $method getGrades
      $param pCallback invoked on success or failure.
  ###

  @getColors = (pCallback) ->
    theDaoHelper.executeQuery 'SELECT id, name, value FROM colors', [], theDaoHelper.MULTIPLE, pCallback
    return

  return

module.exports = new ColorsDao
