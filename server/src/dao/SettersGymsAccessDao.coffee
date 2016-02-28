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

CommentsDao = ->
  'use strict'

  @getAccessList = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT setter_id, gym_id FROM setters_gyms_access WHERE gym_id = ?', [ pGymId ], pCallback
    return

  @createAccess = (pSetterId, pGymId, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO setters_gyms_access (setter_id, gym_id) VALUES (?, ?)', [
      pSetterId
      pGymId
    ], pCallback
    return

  @deleteAccess = (pSetterId, pGymId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM setters_gyms_access WHERE gym_id = ? AND setter_id = ?', [
      pGymId
      pSetterId
    ], pCallback
    return

  return

module.exports = new CommentsDao
