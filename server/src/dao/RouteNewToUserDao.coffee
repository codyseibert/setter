###jslint nomen: true ###

###
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
###

theDB = require('../DBConnection')
theMessages = require('../Messages')
theGymsDao = require('../dao/GymsDao')
theDaoHelper = require('./DaoHelper')

RouteNewToUserDao = ->
  'use strict'

  ###*
  *   When a gym sets a new route
  ###

  @createNewRouteToUserAlertsForGym = (pGymId, pWallId, pRouteId, pCallback) ->

    createNewRouteToUserAlerts = (pHomeGymUsers) ->
      values = []
      user = undefined
      i = undefined
      i = 0
      while i < pHomeGymUsers.length
        user = pHomeGymUsers[i]
        values.push [
          pGymId
          pWallId
          pRouteId
          user.id
        ]
        i += 1
      theDaoHelper.executeQuery 'INSERT INTO route_new_to_user (gym_id, wall_id, route_id, user_id) VALUES ?', [ values ], theDaoHelper.INSERT, pCallback
      return

    theGymsDao.getHomeGymUsers pGymId, createNewRouteToUserAlerts
    return

  ###*
  *   When a user actually views the route on the route.tpl
  ###

  @deleteNewRouteToUserAlert = (pRouteId, pAccountId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM route_new_to_user WHERE route_id = ? AND user_id = ?', [
      pRouteId
      pAccountId
    ], theDaoHelper.DELETE, pCallback
    return

  ###*
      Used when a zone is stripped by removing all 'new' alerts for zone.
  ###

  @deleteAllNewRouteToUserAlertForZone = (pZoneId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM route_new_to_user WHERE wall_id = ?', [ pZoneId ], theDaoHelper.DELETE, pCallback
    return

  ###*
      Used when a zone is stripped by removing all 'new' alerts for zone.
  ###

  @deleteAllNewRouteToUserAlertForZoneColor = (pZoneId, pColorId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM route_new_to_user rntu ' + 'INNER JOIN routes r ON r.id = rntu.route_id ' + 'WHERE r.wall_id = ? AND r.color_id = ?', [
      pZoneId
      pColorId
    ], theDaoHelper.DELETE, pCallback
    return

  return

module.exports = new RouteNewToUserDao
