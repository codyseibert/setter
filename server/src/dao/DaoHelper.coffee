###
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
###

theDB = require('../DBConnection')
theMessages = require('../Messages')

###*
    Helper class used to create the generic functionality required
    with making a query to the database.  It will return an error
    message on any error connecting to the database.

    $param pQuery the query to execute
    $param pValues the values to pass into that query
    $param pCallback the callback to invoke when query finishes
###

DaoHelper = ->
  'use strict'
  @INSERT = 0
  @UPDATE = 1
  @SINGLE = 2
  @MULTIPLE = 3
  @DELETE = 4
  that = this

  @executeQuery = (pQuery, pValues, pType, pCallback) ->
    theDB.query pQuery, pValues, (pErr, pResults) ->
      if pErr
        console.log pErr
        pCallback theMessages.ERROR
      else if !pResults
        pCallback theMessages.error('No results returned on query!')
      else
        if pType == that.INSERT
          pCallback id: pResults.insertId
        else if pType == that.SINGLE
          if pResults.length <= 0
            pCallback theMessages.error('No results returned on SINGLE query!')
          else
            pCallback pResults[0]
        else
          pCallback pResults
      return
    return

  return

module.exports = new DaoHelper
