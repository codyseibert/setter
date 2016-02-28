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

theUsersDao = require('../dao/UsersDao')
theRoutesDao = require('../dao/RoutesDao')
theProgressionsDao = require('../dao/ProgressionsDao')
theAlertsDao = require('../dao/AlertsDao')
theControllerHelper = require('./ControllerHelper')

UsersController = ->
  'use strict'

  @getUser = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getUser userId, callback
    return

  @getUserImage = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getUserImage userId, callback
    return

  @getUsers = (pReq, pRes) ->
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getUsers callback
    return

  @getAlertsForUser = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theAlertsDao.getAlertsForUser userId, callback
    return

  @getUserSendDistributions = (pReq, pRes) ->
    userId = undefined
    type = undefined
    callback = undefined
    userId = pReq.params.userId
    type = pReq.params.type
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getUserSendDistributions userId, type, callback
    return

  @getProgressions = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theProgressionsDao.getProgressions userId, callback
    return

  @getBoulderSends = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getBoulderSends userId, callback
    return

  @getTopRopeSends = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getTopRopeSends userId, callback
    return

  @getLeadSends = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getLeadSends userId, callback
    return

  @setHomeGym = (pReq, pRes) ->
    gymId = undefined
    userId = undefined
    callback = undefined
    gymId = pReq.body.gymId
    userId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.setHomeGym userId, gymId, callback
    return

  @getActivityStream = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theUsersDao.getActivityStream userId, callback
    return

  return

module.exports = new UsersController
