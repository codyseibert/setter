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
theProjectsDao = require('../dao/ProjectsDao')
theUsersDao = require('../dao/UsersDao')
theControllerHelper = require('./ControllerHelper')

ProjectsController = ->
  'use strict'

  @getProjectsForRoute = (pReq, pRes) ->
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theProjectsDao.getProjectsForRoute routeId, callback
    return

  @getProjectsForUser = (pReq, pRes) ->
    userId = undefined
    callback = undefined
    userId = pReq.params.userId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theProjectsDao.getProjectsForUser userId, callback
    return

  @isProject = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    userId = pReq.user.accountId
    callback = theControllerHelper.createNoStatusDefaultCallback(pRes)
    theProjectsDao.isProject userId, routeId, callback
    return

  @createProject = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    callback = undefined
    userId = pReq.user.accountId
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theProjectsDao.createProject userId, routeId, callback
    return

  @deleteProject = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    callback = undefined
    userId = pReq.user.accountId
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theProjectsDao.deleteProject userId, routeId, callback
    return

  return

module.exports = new ProjectsController
