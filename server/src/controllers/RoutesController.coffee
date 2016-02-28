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

theRoutesDao = require('../dao/RoutesDao')
theWallsDao = require('../dao/WallsDao')
theRouteNewToUserDao = require('../dao/RouteNewToUserDao')
theControllerHelper = require('./ControllerHelper')

RoutesController = ->
  'use strict'

  @getRoute = (pReq, pRes) ->
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.getRoute routeId, callback
    return

  @getRoutesInGym = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.getRoutesInGym gymId, callback
    return

  @getRoutesInGym2 = (pReq, pRes) ->
    gymId = undefined
    accountId = undefined
    callback = undefined
    accountId = pReq.user.accountId
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.getRoutesInGym2 accountId, gymId, callback
    return

  @getRoutesOnWall = (pReq, pRes) ->
    wallId = undefined
    accountId = undefined
    callback = undefined
    accountId = pReq.user.accountId
    wallId = pReq.params.wallId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.getRoutesOnWall accountId, wallId, callback
    return

  @createRoute = (pReq, pRes) ->
    gymId = undefined
    wallId = undefined
    name = undefined
    type = undefined
    boulderGradeId = undefined
    topRopeGradeId = undefined
    leadGradeId = undefined
    setterId = undefined
    colorId = undefined
    callback = undefined
    note = undefined
    gymId = pReq.params.gymId
    wallId = pReq.params.wallId
    name = pReq.body.name or ''
    colorId = pReq.body.colorId
    type = pReq.body.type
    boulderGradeId = pReq.body.boulderGradeId
    topRopeGradeId = pReq.body.topRopeGradeId
    leadGradeId = pReq.body.leadGradeId
    setterId = pReq.body.setterId
    note = pReq.body.note or ''
    if type == 0
      topRopeGradeId = null
      leadGradeId = null
    if type == 1
      boulderGradeId = null
      leadGradeId = null
    if type == 2
      topRopeGradeId = null
      boulderGradeId = null
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.createRoute wallId, name, setterId, type, boulderGradeId, topRopeGradeId, leadGradeId, colorId, note, (pRoute) ->
      theRouteNewToUserDao.createNewRouteToUserAlertsForGym gymId, wallId, pRoute.id, (pData) ->
        callback pRoute
        return
      return
    theWallsDao.updateLastUpdate wallId, ->
      undefined
    return

  @updateRoute = (pReq, pRes) ->
    routeId = undefined
    name = undefined
    type = undefined
    boulderGradeId = undefined
    topRopeGradeId = undefined
    leadGradeId = undefined
    setterId = undefined
    colorId = undefined
    callback = undefined
    note = undefined
    routeId = pReq.params.routeId
    name = pReq.body.name or ''
    colorId = pReq.body.colorId
    type = pReq.body.type
    boulderGradeId = pReq.body.boulderGradeId
    topRopeGradeId = pReq.body.topRopeGradeId
    leadGradeId = pReq.body.leadGradeId
    setterId = pReq.body.setterId
    note = pReq.body.note or ''
    if type == 0
      topRopeGradeId = null
      leadGradeId = null
    if type == 1
      boulderGradeId = null
      leadGradeId = null
    if type == 2
      topRopeGradeId = null
      boulderGradeId = null
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.updateRoute routeId, name, setterId, type, boulderGradeId, topRopeGradeId, leadGradeId, colorId, note, callback
    return

  @deleteRoute = (pReq, pRes) ->
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.deleteRoute routeId, callback
    return

  @stripRoute = (pReq, pRes) ->
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRoutesDao.stripRoute routeId, callback
    return

  @deleteNewRouteToUserAlert = (pReq, pRes) ->
    routeId = undefined
    accountId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    accountId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRouteNewToUserDao.deleteNewRouteToUserAlert routeId, accountId, callback
    return

  return

module.exports = new RoutesController
