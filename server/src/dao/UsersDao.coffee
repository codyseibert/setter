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
    UsersDao

    Contains logic related to users.
###

UsersDao = ->
  'use strict'

  @getUser = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT u.account_id, u.firstname, u.lastname, g.account_id AS gym_id, g.name AS gym_name, bouldering_grade, toprope_grade, lead_grade FROM users u ' + 'LEFT JOIN gyms g ON g.account_id = u.gym_id WHERE u.account_id = ?', [ pUserId ], theDaoHelper.SINGLE, pCallback
    return

  @getUserImage = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT a.image_id, i.url FROM accounts a ' + 'LEFT JOIN images i ON i.id = a.image_id ' + 'WHERE a.id = ?', [ pUserId ], theDaoHelper.SINGLE, pCallback
    return

  @getUsers = (pCallback) ->
    theDaoHelper.executeQuery 'SELECT i.url, a.id, u.firstname, u.lastname FROM users u' + 'INNER JOIN accounts a ON a.id = u.account_id ' + 'LEFT JOIN images i ON a.image_id = i.id', [], theDaoHelper.MULTIPLE, pCallback
    return

  @createUser = (pAccountId, pFirstname, pLastname, pGymId, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO users (account_id, firstname, lastname, gym_id) VALUES (?, ?, ?, ?)', [
      pAccountId
      pFirstname
      pLastname
      pGymId
    ], theDaoHelper.INSERT, pCallback
    return

  @setBoulderGrade = (pUserId, pBoulderGrade, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE users SET bouldering_grade = ? WHERE account_id = ?', [
      pBoulderGrade
      pUserId
    ], theDaoHelper.UPDATE, pCallback
    return

  @setTopRopeGrade = (pUserId, pTopRopeGrade, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE users SET toprope_grade = ? WHERE account_id = ?', [
      pTopRopeGrade
      pUserId
    ], theDaoHelper.UPDATE, pCallback
    return

  @setLeadGrade = (pUserId, pLeadGrade, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE users SET lead_grade = ? WHERE account_id = ?', [
      pLeadGrade
      pUserId
    ], theDaoHelper.UPDATE, pCallback
    return

  @computeBoulderGrade = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT AVG(sub.value) AS grade FROM (SELECT g.value FROM users u ' + 'INNER JOIN sends s ON s.user_id = u.account_id ' + 'INNER JOIN routes r ON r.id = s.route_id ' + 'INNER JOIN boulder_grades g ON g.id = r.boulder_grade_id ' + 'WHERE u.account_id = ? ORDER BY g.id DESC limit 10) AS sub', [ pUserId ], theDaoHelper.SINGLE, pCallback
    return

  @computeTopRopeGrade = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT AVG(sub.value) AS grade FROM (SELECT g.value FROM users u ' + 'INNER JOIN sends s ON s.user_id = u.account_id ' + 'INNER JOIN routes r ON r.id = s.route_id ' + 'INNER JOIN rope_grades g ON g.id = r.toprope_grade_id ' + 'WHERE u.account_id = ? ORDER BY g.id DESC limit 10) AS sub', [ pUserId ], theDaoHelper.SINGLE, pCallback
    return

  @computeLeadGrade = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT AVG(sub.value) AS grade FROM (SELECT g.value FROM users u ' + 'INNER JOIN sends s ON s.user_id = u.account_id ' + 'INNER JOIN routes r ON r.id = s.route_id ' + 'INNER JOIN rope_grades g ON g.id = r.lead_grade_id ' + 'WHERE u.account_id = ? ORDER BY g.id DESC limit 10) AS sub', [ pUserId ], theDaoHelper.SINGLE, pCallback
    return

  @getUserSendDistributions = (pUserId, pType, pCallback) ->
    column = 'boulder_grade_id'
    table = 'boulder_grades'
    switch pType
      when 'toprope'
        column = 'toprope_grade_id'
        table = 'rope_grades'
      when 'lead'
        column = 'lead_grade_id'
        table = 'rope_grades'
    theDaoHelper.executeQuery 'SELECT col.name, COUNT(col.name) AS count FROM routes r ' + 'INNER JOIN sends s ON s.route_id = r.id ' + 'INNER JOIN ' + table + ' col ON r.' + column + ' = col.id ' + 'WHERE s.user_id = ? ' + 'GROUP BY col.name ' + 'ORDER BY col.value ASC', [ pUserId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getBoulderSends = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT bg.value, bg.name, s.date FROM sends s ' + 'INNER JOIN routes r ON s.route_id = r.id ' + 'INNER JOIN boulder_grades bg ON r.boulder_grade_id = bg.id WHERE s.user_id = ?', [ pUserId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getTopRopeSends = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT rg.value, rg.name, s.date FROM sends s ' + 'INNER JOIN routes r ON s.route_id = r.id ' + 'INNER JOIN rope_grades rg ON r.toprope_grade_id = rg.id WHERE s.user_id = ?', [ pUserId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getLeadSends = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT rg.value, rg.name, s.date FROM sends s ' + 'INNER JOIN routes r ON s.route_id = r.id ' + 'INNER JOIN rope_grades rg ON r.lead_grade_id = rg.id WHERE s.user_id = ?', [ pUserId ], theDaoHelper.MULTIPLE, pCallback
    return

  @setHomeGym = (pUserId, pGymId, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE users SET gym_id = ? WHERE account_id = ?', [
      pGymId
      pUserId
    ], theDaoHelper.INSERT, pCallback
    return

  @getActivityStream = (pUserId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT a.id, lg.name AS lg, c.value, s.date, bg.name AS bg, rg.name AS rg, CONCAT(u.firstname, \' \', u.lastname) AS name, w.gym_id, r.wall_id, s.route_id FROM users u ' + 'INNER JOIN accounts a ON u.account_id = a.id ' + 'INNER JOIN sends s ON s.user_id = a.id ' + 'INNER JOIN routes r ON r.id = s.route_id ' + 'INNER JOIN walls w ON r.wall_id = w.id ' + 'INNER JOIN colors c ON c.id = r.color_id ' + 'LEFT JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' + 'LEFT JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' + 'LEFT JOIN rope_grades lg ON lg.id = r.lead_grade_id ' + 'WHERE a.id = ? ORDER BY s.date DESC LIMIT 20', [ pUserId ], theDaoHelper.MULTIPLE, pCallback
    return

  return

module.exports = new UsersDao
