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

GradesDao = ->
  'use strict'

  ###*
      Retreieves the boulder grades from the database.

      $method getGrades
      $param pCallback invoked on success or failure.
  ###

  @getBoulderGrades = (pCallback) ->
    theDaoHelper.executeQuery 'SELECT id, name FROM boulder_grades', [], theDaoHelper.MULTIPLE, pCallback
    return

  ###*
      Retreieves the rope grades from the database.

      $method getGrades
      $param pCallback invoked on success or failure.
  ###

  @getRopeGrades = (pCallback) ->
    theDaoHelper.executeQuery 'SELECT id, name FROM rope_grades', [], theDaoHelper.MULTIPLE, pCallback
    return

  return

module.exports = new GradesDao
