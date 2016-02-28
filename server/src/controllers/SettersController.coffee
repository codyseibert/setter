###jslint nomen: true ###

###jslint unparam: true###

###jslint unparam: true, nomen: true###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

theSettersDao = require('../dao/SettersDao')
theControllerHelper = require('./ControllerHelper')

SettersController = ->
  'use strict'

  @getSettersAtGym = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSettersDao.getSettersAtGym gymId, callback
    return

  @getUsers = (pReq, pRes) ->
    callback = undefined
    gymId = undefined
    gymId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSettersDao.getUsers gymId, callback
    return

  @createSetterGymAccess = (pReq, pRes) ->
    callback = undefined
    gymId = undefined
    setterId = undefined
    gymId = pReq.user.accountId
    setterId = pReq.body.setterId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSettersDao.createSetterGymAccess setterId, gymId, callback
    return

  @deleteSetterGymAccess = (pReq, pRes) ->
    callback = undefined
    gymId = undefined
    setterId = undefined
    gymId = pReq.user.accountId
    setterId = pReq.params.setterId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSettersDao.deleteSetterGymAccess setterId, gymId, callback
    return

  return

module.exports = new SettersController
