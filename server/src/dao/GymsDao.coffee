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
    GymsDao

    Contains logic related to gyms.
###

GymsDao = ->
  'use strict'
  BEST_ROUTES_LIMIT = 15
  NEWEST_ROUTES_LIMIT = 15
  COUNT_THRESH = 4

  @getGym = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT account_id, name, address, facebook FROM gyms WHERE account_id = ?', [ pGymId ], theDaoHelper.SINGLE, pCallback
    return

  @getGymSettings = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT hide_setters FROM gyms WHERE account_id = ?', [ pGymId ], theDaoHelper.SINGLE, pCallback
    return

  @getGymUsersGrades = (pGymId, pType, pCallback) ->
    column = 'bouldering_grade'
    prefix = 'V'
    switch pType
      when 'toprope'
        column = 'toprope_grade'
        prefix = '5.'
      when 'lead'
        column = 'lead_grade'
        prefix = '5.'
    theDaoHelper.executeQuery 'SELECT COUNT(*) AS count, CONCAT(\'' + prefix + '\', ROUND(' + column + ')) AS name ' + 'FROM users u WHERE u.gym_id = ? GROUP BY name ORDER BY ' + column + ' ASC', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getGyms = (pCallback) ->
    theDaoHelper.executeQuery 'SELECT i.url, g.account_id, g.name, g.address FROM gyms g ' + 'INNER JOIN accounts a ON a.id = g.account_id ' + 'LEFT JOIN images i ON i.id = a.image_id', [], theDaoHelper.MULTIPLE, pCallback
    return

  @getGymImage = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT i.url FROM accounts a ' + 'LEFT JOIN images i ON i.id = a.image_id ' + 'WHERE a.id = ?', [ pGymId ], theDaoHelper.SINGLE, pCallback
    return

  @createGym = (pAccountId, pName, pAddress, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO gyms (account_id, name, address) VALUES (?, ?, ?)', [
      pAccountId
      pName
      pAddress
    ], theDaoHelper.INSERT, pCallback
    return

  @updateGym = (pId, pName, pAddress, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE gyms SET name = ? AND address = ? WHERE account_id = ?', [
      pName
      pAddress
      pId
    ], theDaoHelper.UPDATE, pCallback
    return

  @getDistributions = (pGymId, pType, pCallback) ->
    column = 'boulder_grade_id'
    table = 'boulder_grades'
    switch pType
      when 'toprope'
        column = 'toprope_grade_id'
        table = 'rope_grades'
      when 'lead'
        column = 'lead_grade_id'
        table = 'rope_grades'
    theDaoHelper.executeQuery 'SELECT col.name, COUNT(col.name) AS count FROM routes r ' + 'INNER JOIN walls w ON w.id = r.wall_id ' + 'INNER JOIN ' + table + ' col ON r.' + column + ' = col.id ' + 'WHERE w.gym_id = ? AND r.active = 1 ' + 'GROUP BY col.name ' + 'ORDER BY col.value ASC', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  ###
      SECTION - All Current
  ###

  @getAllCurrentRoutes = (pUserId, pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT ro.id, w.name AS zone_name, AVG(ra.rating) AS rating, ' + '(SELECT true FROM sends s WHERE s.route_id = ro.id AND s.user_id = ?) AS send, ' + '(SELECT rntu.id FROM route_new_to_user rntu WHERE rntu.route_id = ro.id AND rntu.user_id = ?) AS isNew, ' + '(SELECT COUNT(*) FROM ratings r WHERE r.route_id = ro.id) AS count, ' + 'c.value, w.id AS wall_id, w.gym_id AS gym_id, ro.date, bg.name AS boulder_grade, rg1.name AS toprope_grade, rg2.name AS lead_grade ' + 'FROM routes ro ' + 'INNER JOIN colors c ON ro.color_id = c.id ' + 'INNER JOIN walls w ON w.id = ro.wall_id ' + 'LEFT JOIN ratings ra ON ra.route_id = ro.id ' + 'LEFT JOIN rope_grades rg1 ON ro.toprope_grade_id = rg1.id ' + 'LEFT JOIN rope_grades rg2 ON ro.lead_grade_id = rg2.id ' + 'LEFT JOIN boulder_grades bg ON ro.boulder_grade_id = bg.id ' + 'WHERE ro.active = true AND w.gym_id = ?' + 'GROUP BY ro.id', [
      pUserId
      pUserId
      pGymId
    ], theDaoHelper.MULTIPLE, pCallback
    return

  ###
      SECTION - Current
  ###

  @getCurrentBoulderRoutes = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT bg.name, bg.value FROM routes r ' + 'INNER JOIN walls w ON w.id = r.wall_id ' + 'INNER JOIN boulder_grades bg ON r.boulder_grade_id = bg.id WHERE w.gym_id = ? AND r.active = 1', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getCurrentTopRopeRoutes = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT rg.name, rg.value FROM routes r ' + 'INNER JOIN walls w ON w.id = r.wall_id ' + 'INNER JOIN rope_grades rg ON r.toprope_grade_id = rg.id WHERE w.gym_id = ? AND r.active = 1', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getCurrentLeadRoutes = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT rg.name, rg.value FROM routes r ' + 'INNER JOIN walls w ON w.id = r.wall_id ' + 'INNER JOIN rope_grades rg ON r.lead_grade_id = rg.id WHERE w.gym_id = ? AND r.active = 1', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  ###
      SECTION - Newest
  ###

  @getNewestBoulder = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT ro.id, c.value, w.name AS zone_name, AVG(IFNULL(ra.rating, 0)) AS rating, w.id AS wall_id, w.gym_id AS gym_id, ro.date, bg.name AS boulder_grade ' + 'FROM routes ro ' + 'INNER JOIN colors c ON ro.color_id = c.id ' + 'INNER JOIN walls w ON w.id = ro.wall_id ' + 'INNER JOIN boulder_grades bg ON ro.boulder_grade_id = bg.id ' + 'LEFT JOIN ratings ra ON ra.route_id = ro.id ' + 'WHERE ro.active = true AND w.gym_id = ? ' + 'GROUP BY ro.id ' + 'ORDER BY date DESC LIMIT ' + NEWEST_ROUTES_LIMIT, [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getNewestTopRope = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT ro.id, c.value, w.name AS zone_name, AVG(IFNULL(ra.rating, 0)) AS rating, w.id AS wall_id, w.gym_id AS gym_id, ro.date, rg.name AS rope_grade ' + 'FROM routes ro ' + 'INNER JOIN colors c ON ro.color_id = c.id ' + 'INNER JOIN walls w ON w.id = ro.wall_id ' + 'INNER JOIN rope_grades rg ON ro.toprope_grade_id = rg.id ' + 'LEFT JOIN ratings ra ON ra.route_id = ro.id ' + 'WHERE ro.active = true AND w.gym_id = ? ' + 'GROUP BY ro.id ' + 'ORDER BY date DESC LIMIT ' + NEWEST_ROUTES_LIMIT, [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getNewestLead = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT ro.id, c.value, w.name AS zone_name, AVG(IFNULL(ra.rating, 0)) AS rating, w.id AS wall_id, w.gym_id AS gym_id, ro.date, ro.date, rg.name AS rope_grade ' + 'FROM routes ro ' + 'INNER JOIN colors c ON ro.color_id = c.id ' + 'INNER JOIN walls w ON w.id = ro.wall_id ' + 'INNER JOIN rope_grades rg ON ro.lead_grade_id = rg.id ' + 'LEFT JOIN ratings ra ON ra.route_id = ro.id ' + 'WHERE ro.active = true AND w.gym_id = ? ' + 'GROUP BY ro.id ' + 'ORDER BY date DESC LIMIT ' + NEWEST_ROUTES_LIMIT, [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  ###
      SECTION - Best Rated
  ###

  @getBestRatedBoulder = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT ro.id, w.name AS zone_name, AVG(ra.rating) AS rating, (SELECT COUNT(*) FROM ratings r WHERE r.route_id = ro.id) AS count, c.value, w.id AS wall_id, w.gym_id AS gym_id, ro.date, bg.name AS boulder_grade ' + 'FROM routes ro ' + 'INNER JOIN ratings ra ON ra.route_id = ro.id ' + 'INNER JOIN colors c ON ro.color_id = c.id ' + 'INNER JOIN walls w ON w.id = ro.wall_id ' + 'INNER JOIN boulder_grades bg ON ro.boulder_grade_id = bg.id ' + 'WHERE ro.active = true AND w.gym_id = ? AND (SELECT COUNT(*) FROM ratings r WHERE r.route_id = ro.id) > ' + COUNT_THRESH + ' ' + 'GROUP BY ro.id ' + 'ORDER BY rating DESC LIMIT ' + BEST_ROUTES_LIMIT, [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getBestRatedTopRope = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT ro.id, w.name AS zone_name, AVG(ra.rating) AS rating, (SELECT COUNT(*) FROM ratings r WHERE r.route_id = ro.id) AS count, c.value, w.id AS wall_id, w.gym_id AS gym_id, ro.date, ro.date, rg.name AS rope_grade ' + 'FROM routes ro ' + 'INNER JOIN ratings ra ON ra.route_id = ro.id ' + 'INNER JOIN colors c ON ro.color_id = c.id ' + 'INNER JOIN walls w ON w.id = ro.wall_id ' + 'INNER JOIN rope_grades rg ON ro.toprope_grade_id = rg.id ' + 'WHERE ro.active = true AND w.gym_id = ? AND (SELECT COUNT(*) FROM ratings r WHERE r.route_id = ro.id) > ' + COUNT_THRESH + ' ' + 'GROUP BY ro.id ' + 'ORDER BY rating DESC LIMIT ' + BEST_ROUTES_LIMIT, [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getBestRatedLead = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT ro.id, w.name AS zone_name, AVG(ra.rating) AS rating, (SELECT COUNT(*) FROM ratings r WHERE r.route_id = ro.id) AS count, c.value, w.id AS wall_id, w.gym_id AS gym_id, ro.date, rg.name AS rope_grade ' + 'FROM routes ro ' + 'INNER JOIN ratings ra ON ra.route_id = ro.id ' + 'INNER JOIN colors c ON ro.color_id = c.id ' + 'INNER JOIN walls w ON w.id = ro.wall_id ' + 'INNER JOIN rope_grades rg ON ro.lead_grade_id = rg.id ' + 'WHERE ro.active = true AND w.gym_id = ? AND (SELECT COUNT(*) FROM ratings r WHERE r.route_id = ro.id) > ' + COUNT_THRESH + ' ' + 'GROUP BY ro.id ' + 'ORDER BY rating DESC LIMIT ' + BEST_ROUTES_LIMIT, [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getBoulderRouteDistribution = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT w.name AS zone, bg.name AS grade, COUNT(*) AS count FROM routes r ' + 'INNER JOIN walls w ON r.wall_id = w.id ' + 'INNER JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' + 'WHERE w.gym_id = ? AND r.active = true GROUP BY w.name, r.boulder_grade_id', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getTopRopeRouteDistribution = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT w.name AS zone, rg.name AS grade, COUNT(*) AS count FROM routes r ' + 'INNER JOIN walls w ON r.wall_id = w.id ' + 'INNER JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' + 'WHERE w.gym_id = ? AND r.active = true GROUP BY w.name, r.toprope_grade_id', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getLeadRouteDistribution = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT w.name AS zone, rg.name AS grade, COUNT(*) AS count FROM routes r ' + 'INNER JOIN walls w ON r.wall_id = w.id ' + 'INNER JOIN rope_grades rg ON rg.id = r.lead_grade_id ' + 'WHERE w.gym_id = ? AND r.active = true GROUP BY w.name, r.lead_grade_id', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getHomeGymUsers = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT a.id, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url, EXISTS(SELECT s.user_id FROM sends s WHERE s.date > DATE_SUB(NOW(), INTERVAL 30 DAY) AND s.user_id = a.id LIMIT 1) AS active FROM users u ' + 'INNER JOIN accounts a ON u.account_id = a.id ' + 'LEFT JOIN images i ON a.image_id = i.id ' + 'WHERE u.gym_id = ?', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getActivityStream = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT a.id, lg.name AS lg, c.value, u.gym_id, r.id AS route_id, r.wall_id, s.date, bg.name AS bg, rg.name AS rg, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url FROM users u ' + 'INNER JOIN accounts a ON u.account_id = a.id ' + 'LEFT JOIN images i ON a.image_id = i.id ' + 'INNER JOIN sends s ON s.user_id = a.id ' + 'INNER JOIN routes r ON r.id = s.route_id ' + 'INNER JOIN colors c ON c.id = r.color_id ' + 'LEFT JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' + 'LEFT JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' + 'LEFT JOIN rope_grades lg ON lg.id = r.lead_grade_id ' + 'WHERE u.gym_id = ? ORDER BY s.date DESC LIMIT 15', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  @getNumberOfNewRoutes = (pGymId, pAccountId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT COUNT(*) AS count FROM route_new_to_user rntu WHERE rntu.gym_id = ? AND rntu.user_id = ?', [
      pGymId
      pAccountId
    ], theDaoHelper.SINGLE, pCallback
    return

  @getLatestComments = (pGymId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT u.account_id, c.message, lg.name AS lg, w.name AS zone, co.value, u.gym_id, r.id AS route_id, r.wall_id, c.date, bg.name AS bg, rg.name AS rg, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url FROM comments c ' + 'INNER JOIN users u ON u.account_id = c.user_id ' + 'INNER JOIN accounts a ON u.account_id = a.id ' + 'INNER JOIN routes r on r.id = c.route_id ' + 'INNER JOIN walls w on r.wall_id = w.id ' + 'INNER JOIN colors co ON co.id = r.color_id ' + 'LEFT JOIN images i ON a.image_id = i.id ' + 'LEFT JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' + 'LEFT JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' + 'LEFT JOIN rope_grades lg ON lg.id = r.lead_grade_id ' + 'WHERE u.gym_id = ? ORDER BY c.date DESC LIMIT 15', [ pGymId ], theDaoHelper.MULTIPLE, pCallback
    return

  return

module.exports = new GymsDao
