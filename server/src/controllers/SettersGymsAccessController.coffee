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

theSettersGymsAccessDao = require('../dao/SettersGymsAccessDao')
theControllerHelper = require('./ControllerHelper')

SettersGymsAccessController = ->
  'use strict'

  @getAccessList = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.user.id
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSettersGymsAccessDao.getAccessList gymId, callback
    return

  @createAccess = (pReq, pRes) ->
    gymId = undefined
    setterId = undefined
    callback = undefined
    gymId = pReq.user.id
    setterId = pReq.params.id
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSettersGymsAccessDao.createAccess setterId, gymId, callback
    return

  @deleteAccess = (pReq, pRes) ->
    gymId = undefined
    setterId = undefined
    callback = undefined
    gymId = pReq.user.id
    setterId = pReq.params.id
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSettersGymsAccessDao.deleteAccess setterId, gymId, callback
    return

  return

module.exports = new SettersGymsAccessController
