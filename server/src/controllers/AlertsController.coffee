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

theAlertsDao = require('../dao/AlertsDao')
theControllerHelper = require('./ControllerHelper')

AlertsController = ->
  'use strict'

  @getAlertsForGym = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theAlertsDao.getAlertsForGym gymId, callback
    return

  @createAlert = (pReq, pRes) ->
    gymId = undefined
    message = undefined
    callback = undefined
    gymId = pReq.params.gymId
    message = pReq.body.message
    callback = theControllerHelper.createDefaultCallback(pRes)
    theAlertsDao.createAlert gymId, message, callback
    return

  @deleteAlert = (pReq, pRes) ->
    id = undefined
    callback = undefined
    id = pReq.params.alertId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theAlertsDao.deleteAlert id, callback
    return

  return

module.exports = new AlertsController
