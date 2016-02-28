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

theGymsDao = require('../dao/GymsDao')
theProjectsDao = require('../dao/ProjectsDao')
theControllerHelper = require('./ControllerHelper')

GymsController = ->
  'use strict'

  @getGym = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getGym gymId, callback
    return

  @getGyms = (pReq, pRes) ->
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getGyms callback
    return

  @getLatestProjects = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theProjectsDao.getLatestProjectsForGym gymId, callback
    return

  @getGymSettings = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getGymSettings gymId, callback
    return

  @getGymImage = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getGymImage gymId, callback
    return

  @getDistributions = (pReq, pRes) ->
    gymId = undefined
    type = undefined
    callback = undefined
    gymId = pReq.params.gymId
    type = pReq.params.type
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getDistributions gymId, type, callback
    return

  @getGymUsersGrades = (pReq, pRes) ->
    gymId = undefined
    type = undefined
    callback = undefined
    gymId = pReq.params.gymId
    type = pReq.params.type
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getGymUsersGrades gymId, type, callback
    return

  @getAllCurrentRoutes = (pReq, pRes) ->
    gymId = undefined
    accountId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    accountId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getAllCurrentRoutes accountId, gymId, callback
    return

  @getCurrentBoulderRoutes = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getCurrentBoulderRoutes gymId, callback
    return

  @getCurrentTopRopeRoutes = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getCurrentTopRopeRoutes gymId, callback
    return

  @getCurrentLeadRoutes = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getCurrentLeadRoutes gymId, callback
    return

  @getBoulderRouteDistribution = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getBoulderRouteDistribution gymId, callback
    return

  @getTopRopeRouteDistribution = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getTopRopeRouteDistribution gymId, callback
    return

  @getLeadRouteDistribution = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getLeadRouteDistribution gymId, callback
    return

  @getBestRatedBoulder = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getBestRatedBoulder gymId, callback
    return

  @getBestRatedTopRope = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getBestRatedTopRope gymId, callback
    return

  @getBestRatedLead = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getBestRatedLead gymId, callback
    return

  @getNewestBoulder = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getNewestBoulder gymId, callback
    return

  @getNewestTopRope = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getNewestTopRope gymId, callback
    return

  @getNewestLead = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getNewestLead gymId, callback
    return

  @getLatestComments = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getLatestComments gymId, callback
    return

  @getHomeGymUsers = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getHomeGymUsers gymId, callback
    return

  @getActivityStream = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getActivityStream gymId, callback
    return

  @getNumberOfNewRoutes = (pReq, pRes) ->
    gymId = undefined
    accountId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    accountId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymsDao.getNumberOfNewRoutes gymId, accountId, callback
    return

  return

module.exports = new GymsController
