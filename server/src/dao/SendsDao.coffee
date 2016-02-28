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

SendsDao = ->
  'use strict'

  @getSendsForRoute = (pRouteId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT u.account_id, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url, s.route_id FROM sends s ' + 'INNER JOIN users u ON u.account_id = s.user_id ' + 'INNER JOIN accounts a ON a.id = u.account_id ' + 'LEFT JOIN images i ON a.image_id = i.id ' + 'WHERE s.route_id = ?', [ pRouteId ], theDaoHelper.MULTIPLE, pCallback
    return

  @hasSent = (pUserId, pRouteId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT s.user_id FROM sends s WHERE s.user_id = ? AND s.route_id = ?', [
      pUserId
      pRouteId
    ], theDaoHelper.SINGLE, pCallback
    return

  @createSend = (pUserId, pRouteId, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO sends (user_id, route_id, date) VALUES (?, ?, NOW())', [
      pUserId
      pRouteId
    ], theDaoHelper.INSERT, pCallback
    return

  @deleteSend = (pUserId, pRouteId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM sends WHERE user_id = ? AND route_id = ?', [
      pUserId
      pRouteId
    ], theDaoHelper.DELETE, pCallback
    return

  @getBoulderRoutesSentByUser = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT r.id, r.name, g.name, c.name FROM sends s ' + 'INNER JOIN routes r ON r.id = s.route_id ' + 'INNER JOIN colors c ON r.color_id = c.id ' + 'INNER JOIN boulder_grades g ON r.grade_id = g.id WHERE s.user_id = ?', [ pUserId ], pCallback
    return

  return

module.exports = new SendsDao
