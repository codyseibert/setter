/*jslint nomen: true */

/*
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
*/

var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('./DaoHelper');

/**
    GymsDao

    Contains logic related to gyms.
*/
var GymsDao = function () {
    'use strict';

    var BEST_ROUTES_LIMIT = 15,
        NEWEST_ROUTES_LIMIT = 15;

    this.getGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id, name, address FROM gyms WHERE account_id = ?',
            [pGymId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getGymUsersBoulderingGrades = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT COUNT(*) AS count, ROUND(bouldering_grade) AS grade FROM users u WHERE u.gym_id = ? GROUP BY grade ORDER BY grade ASC',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getGymUsersTopRopeGrades = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT COUNT(*) AS count, ROUND(toprope_grade) AS grade FROM users u WHERE u.gym_id = ? GROUP BY grade ORDER BY grade ASC',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getGymUsersLeadGrades = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT COUNT(*) AS count, ROUND(lead_grade) AS grade FROM users u WHERE u.gym_id = ? GROUP BY grade ORDER BY grade ASC',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getGyms = function (pCallback) {
        theDaoHelper.executeQuery(
            'SELECT i.url, g.account_id, g.name, g.address FROM gyms g ' +
                'INNER JOIN accounts a ON a.id = g.account_id ' +
                'LEFT JOIN images i ON i.id = a.image_id',
            [],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getGymImage = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT i.url FROM accounts a ' +
                'LEFT JOIN images i ON i.id = a.image_id ' +
                'WHERE a.id = ?',
            [pGymId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.createGym = function (pAccountId, pName, pAddress, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO gyms (account_id, name, address) VALUES (?, ?, ?)',
            [pAccountId, pName, pAddress],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.updateGym = function (pId, pName, pAddress, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE gyms SET name = ? AND address = ? WHERE account_id = ?',
            [pName, pAddress, pId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };




    /*
        SECTION - Current
    */
    this.getCurrentBoulderRoutes = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT bg.name, bg.value FROM routes r ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'INNER JOIN boulder_grades bg ON r.boulder_grade_id = bg.id WHERE w.gym_id = ? AND r.active = 1',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getCurrentTopRopeRoutes = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT rg.name, rg.value FROM routes r ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'INNER JOIN rope_grades rg ON r.toprope_grade_id = rg.id WHERE w.gym_id = ? AND r.active = 1',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getCurrentLeadRoutes = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT rg.name, rg.value FROM routes r ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'INNER JOIN rope_grades rg ON r.lead_grade_id = rg.id WHERE w.gym_id = ? AND r.active = 1',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };




    /*
        SECTION - Newest
    */
    this.getNewestBoulder = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT ro.id, c.value, w.name AS zone_name, w.id AS wall_id, w.gym_id AS gym_id, ro.date, bg.name AS boulder_grade ' +
                'FROM routes ro ' +
                'INNER JOIN colors c ON ro.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = ro.wall_id ' +
                'INNER JOIN boulder_grades bg ON ro.boulder_grade_id = bg.id ' +
                'WHERE ro.active = true AND w.gym_id = ? ' +
                'ORDER BY date DESC LIMIT ' + NEWEST_ROUTES_LIMIT,
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getNewestTopRope = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT ro.id, c.value, w.name AS zone_name, w.id AS wall_id, w.gym_id AS gym_id, ro.date, rg.name AS rope_grade ' +
                'FROM routes ro ' +
                'INNER JOIN colors c ON ro.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = ro.wall_id ' +
                'INNER JOIN rope_grades rg ON ro.toprope_grade_id = rg.id ' +
                'WHERE ro.active = true AND w.gym_id = ? ' +
                'ORDER BY date DESC LIMIT ' + NEWEST_ROUTES_LIMIT,
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getNewestLead = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT ro.id, c.value, w.name AS zone_name, w.id AS wall_id, w.gym_id AS gym_id, ro.date, ro.date, rg.name AS rope_grade ' +
                'FROM routes ro ' +
                'INNER JOIN colors c ON ro.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = ro.wall_id ' +
                'INNER JOIN rope_grades rg ON ro.lead_grade_id = rg.id ' +
                'WHERE ro.active = true AND w.gym_id = ? ' +
                'ORDER BY date DESC LIMIT ' + NEWEST_ROUTES_LIMIT,
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };



    /*
        SECTION - Best Rated
    */
    this.getBestRatedBoulder = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT ro.id, w.name AS zone_name, AVG(ra.rating) AS rating, c.value, w.id AS wall_id, w.gym_id AS gym_id, ro.date, bg.name AS boulder_grade ' +
                'FROM routes ro ' +
                'INNER JOIN ratings ra ON ra.route_id = ro.id ' +
                'INNER JOIN colors c ON ro.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = ro.wall_id ' +
                'INNER JOIN boulder_grades bg ON ro.boulder_grade_id = bg.id ' +
                'WHERE ro.active = true AND w.gym_id = ? ' +
                'GROUP BY ro.id ' +
                'ORDER BY rating DESC LIMIT ' + BEST_ROUTES_LIMIT,
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getBestRatedTopRope = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT ro.id, w.name AS zone_name, AVG(ra.rating) AS rating, c.value, w.id AS wall_id, w.gym_id AS gym_id, ro.date, ro.date, rg.name AS rope_grade ' +
                'FROM routes ro ' +
                'INNER JOIN ratings ra ON ra.route_id = ro.id ' +
                'INNER JOIN colors c ON ro.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = ro.wall_id ' +
                'INNER JOIN rope_grades rg ON ro.toprope_grade_id = rg.id ' +
                'WHERE ro.active = true AND w.gym_id = ? ' +
                'GROUP BY ro.id ' +
                'ORDER BY rating DESC LIMIT ' + BEST_ROUTES_LIMIT,
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getBestRatedLead = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT ro.id, w.name AS zone_name, AVG(ra.rating) AS rating, c.value, w.id AS wall_id, w.gym_id AS gym_id, ro.date, rg.name AS rope_grade ' +
                'FROM routes ro ' +
                'INNER JOIN ratings ra ON ra.route_id = ro.id ' +
                'INNER JOIN colors c ON ro.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = ro.wall_id ' +
                'INNER JOIN rope_grades rg ON ro.lead_grade_id = rg.id ' +
                'WHERE ro.active = true AND w.gym_id = ? ' +
                'GROUP BY ro.id ' +
                'ORDER BY rating DESC LIMIT ' + BEST_ROUTES_LIMIT,
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };





    this.getBoulderRouteDistribution = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT w.name AS zone, bg.name AS grade, COUNT(*) AS count FROM routes r ' +
                'INNER JOIN walls w ON r.wall_id = w.id ' +
                'INNER JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' +
                'WHERE w.gym_id = ? AND r.active = true GROUP BY w.name, r.boulder_grade_id',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getTopRopeRouteDistribution = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT w.name AS zone, rg.name AS grade, COUNT(*) AS count FROM routes r ' +
                'INNER JOIN walls w ON r.wall_id = w.id ' +
                'INNER JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' +
                'WHERE w.gym_id = ? AND r.active = true GROUP BY w.name, r.toprope_grade_id',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getLeadRouteDistribution = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT w.name AS zone, rg.name AS grade, COUNT(*) AS count FROM routes r ' +
                'INNER JOIN walls w ON r.wall_id = w.id ' +
                'INNER JOIN rope_grades rg ON rg.id = r.lead_grade_id ' +
                'WHERE w.gym_id = ? AND r.active = true GROUP BY w.name, r.lead_grade_id',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };





    this.getHomeGymUsers = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT a.id, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url FROM users u ' +
                'INNER JOIN accounts a ON u.account_id = a.id ' +
                'LEFT JOIN images i ON a.image_id = i.id ' +
                'WHERE u.gym_id = ?',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getActivityStream = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT a.id, lg.name AS lg, c.value, r.id AS route_id, r.wall_id, s.date, bg.name AS bg, rg.name AS rg, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url FROM users u ' +
                'INNER JOIN accounts a ON u.account_id = a.id ' +
                'LEFT JOIN images i ON a.image_id = i.id ' +
                'INNER JOIN sends s ON s.user_id = a.id ' +
                'INNER JOIN routes r ON r.id = s.route_id ' +
                'INNER JOIN colors c ON c.id = r.color_id ' +
                'LEFT JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' +
                'LEFT JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' +
                'LEFT JOIN rope_grades lg ON lg.id = r.lead_grade_id ' +
                'WHERE u.gym_id = ? ORDER BY s.date DESC LIMIT 20',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getNumberOfNewRoutes = function (pGymId, pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT COUNT(*) AS count FROM route_new_to_user rntu WHERE rntu.gym_id = ? AND rntu.user_id = ?',
            [pGymId, pAccountId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };
};

module.exports = new GymsDao();
