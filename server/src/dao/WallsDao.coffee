###jslint nomen: true ###

###
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
###

theRouteNewToUserDao = require('../dao/RouteNewToUserDao')
theDB = require('../DBConnection')
theMessages = require('../Messages')
theDaoHelper = require('./DaoHelper')

###*
    WallsDao

    Contains logic related to Walls.
###

WallsDao = ->
  'use strict'

  @getWallsInGym = (pGymId, pAccountId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT w.id, w.name, w.last_update, i.url, ' + '(SELECT COUNT(*) FROM route_new_to_user rntu WHERE rntu.wall_id = w.id AND rntu.user_id = ?) AS new_count, ' + '(SELECT COUNT(*) FROM routes r WHERE r.wall_id = w.id AND r.active = 1) AS route_count ' + 'FROM walls w ' + 'LEFT JOIN images i ON i.id = w.image_id ' + 'WHERE w.gym_id = ?', [
      pAccountId
      pGymId
    ], theDaoHelper.MULTIPLE, pCallback
    return

  @getWall = (pWallId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT w.id, w.name, i.url FROM walls w ' + 'LEFT JOIN images i ON i.id = w.image_id WHERE w.id = ?', [ pWallId ], theDaoHelper.SINGLE, pCallback
    return

  @createWall = (pWallName, pGymId, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO walls (name, gym_id) VALUES (?, ?)', [
      pWallName
      pGymId
    ], theDaoHelper.INSERT, pCallback
    return

  @updateWall = (pAccountId, pWallId, pName, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE walls SET name = ? WHERE id = ? AND gym_id = ?', [
      pName
      pWallId
      pAccountId
    ], theDaoHelper.UPDATE, pCallback
    return

  @updateImage = (pImageId, pWallId, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE walls SET image_id = ? WHERE id = ?', [
      pImageId
      pWallId
    ], theDaoHelper.UPDATE, pCallback
    return

  @updateLastUpdate = (pWallId, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE walls SET last_update = NOW() WHERE id = ?', [ pWallId ], theDaoHelper.UPDATE, pCallback
    return

  @deleteWall = (pAccountId, pWallId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM walls WHERE id = ? AND gym_id = ?', [
      pWallId
      pAccountId
    ], theDaoHelper.DELETE, pCallback
    return

  @stripZone = (pZoneId, pCallback) ->

    deleteAlerts = (pResults) ->
      theRouteNewToUserDao.deleteAllNewRouteToUserAlertForZone pZoneId, ->
        pCallback pResults
        return
      return

    theDaoHelper.executeQuery 'UPDATE routes SET active = 0 WHERE wall_id = ? AND active = 1', [ pZoneId ], theDaoHelper.UPDATE, deleteAlerts
    return

  @stripColor = (pZoneId, pColorId, pCallback) ->

    deleteAlerts = (pResults) ->
      theRouteNewToUserDao.deleteAllNewRouteToUserAlertForZoneColor pZoneId, pColorId, ->
        pCallback pResults
        return
      return

    theDaoHelper.executeQuery 'UPDATE routes SET active = 0 WHERE wall_id = ? AND color_id = ? AND active = 1', [
      pZoneId
      pColorId
    ], theDaoHelper.UPDATE, deleteAlerts
    return

  return

module.exports = new WallsDao
