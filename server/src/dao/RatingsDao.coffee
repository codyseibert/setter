###jslint nomen: true ###

###
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
###

theDB = require('../DBConnection')
theMessages = require('../Messages')
theDaoHelper = require('./DaoHelper')

###*
    RoutesDao

    Contains logic related to Routes.
###

RatingsDao = ->
  'use strict'

  @getRatingForRoute = (pRouteId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT AVG(rating) AS rating, COUNT(rating) AS count FROM ratings WHERE route_id = ?', [ pRouteId ], theDaoHelper.SINGLE, pCallback
    return

  @updateRating = (pUserId, pRouteId, pRating, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO ratings (user_id, route_id, rating) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE rating = ?', [
      pUserId
      pRouteId
      pRating
      pRating
    ], theDaoHelper.UPDATE, pCallback
    return

  @hasRated = (pUserId, pRouteId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT rating FROM ratings WHERE user_id = ? AND route_id = ?', [
      pUserId
      pRouteId
    ], theDaoHelper.SINGLE, pCallback
    return

  return

module.exports = new RatingsDao
