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

theSendsDao = require('../dao/SendsDao')
theRoutesDao = require('../dao/RoutesDao')
theUsersDao = require('../dao/UsersDao')
theProgressionsDao = require('../dao/ProgressionsDao')
theControllerHelper = require('./ControllerHelper')

SendsController = ->
  'use strict'

  @getSendsForRoute = (pReq, pRes) ->
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSendsDao.getSendsForRoute routeId, callback
    return

  @hasSent = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    userId = pReq.user.accountId
    callback = theControllerHelper.createNoStatusDefaultCallback(pRes)
    theSendsDao.hasSent userId, routeId, callback
    return

  refreshBoulderingGrade = (pUserId) ->
    theUsersDao.computeBoulderGrade pUserId, (pData) ->
      theUsersDao.setBoulderGrade pUserId, pData.grade, (pData) ->
        theProgressionsDao.refreshProgressions pUserId, ->
        return
      return
    return

  refreshTopRopeGrade = (pUserId) ->
    theUsersDao.computeTopRopeGrade pUserId, (pData) ->
      theUsersDao.setTopRopeGrade pUserId, pData.grade, (pData) ->
        theProgressionsDao.refreshProgressions pUserId, ->
        return
      return
    return

  refreshLeadGrade = (pUserId) ->
    theUsersDao.computeLeadGrade pUserId, (pData) ->
      theUsersDao.setLeadGrade pUserId, pData.grade, (pData) ->
        theProgressionsDao.refreshProgressions pUserId, ->
        return
      return
    return

  refreshGrades = (pUserId, pRouteId) ->
    theRoutesDao.getRoute pRouteId, (pData) ->
      if pData.boulder_grade_id
        refreshBoulderingGrade pUserId
      else if pData.toprope_grade_id
        refreshTopRopeGrade pUserId
      else if pData.lead_grade_id
        refreshLeadGrade pUserId
      return
    return

  @createSend = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    callback = undefined
    userId = pReq.user.accountId
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSendsDao.createSend userId, routeId, (pData) ->
      refreshGrades userId, routeId
      callback pData
      return
    return

  @deleteSend = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    callback = undefined
    userId = pReq.user.accountId
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSendsDao.deleteSend userId, routeId, (pData) ->
      refreshGrades userId, routeId
      callback pData
      return
    return

  return

module.exports = new SendsController
