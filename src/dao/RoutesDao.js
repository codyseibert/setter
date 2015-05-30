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
    RoutesDao

    Contains logic related to Routes.
*/
var RoutesDao = function () {
    'use strict';

    this.getRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.type, r.id AS route_id, r.wall_id, w.gym_id, r.name AS route_name, r.setter_id, w.name AS wall_name, r.boulder_grade_id, lg.name AS lead_grade, r.lead_grade_id, r.toprope_grade_id, r.color_id, lg.name AS lead_grade, bg.name AS boulder_grade, rg.name AS toprope_grade, c.name AS color, c.value AS value, u.firstname, u.lastname, r.date, r.note FROM routes r ' +
                'INNER JOIN users u ON r.setter_id = u.account_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.toprope_grade_id = rg.id ' +
                'LEFT JOIN rope_grades lg ON r.lead_grade_id = lg.id ' +
                'WHERE r.id = ?',
            [pRouteId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getRoutesInGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.active, r.id AS route_id, r.wall_id, w.gym_id, r.type, r.setter_id, w.gym_id, w.name AS wall_name, w.id AS wall_id, r.lead_grade_id, lg.name AS lead_grade, r.name AS route_name, bg.name AS boulder_grade, rg.name AS toprope_grade, bg.id AS boulder_grade_id, rg.id AS toprope_grade_id, c.name AS color, c.value AS value, CONCAT(u.firstname, \' \', u.lastname) AS setter, r.date, ' +
                '(SELECT COUNT(*) FROM sends s WHERE s.route_id = r.id) AS sends, ' +
                '(SELECT ROUND(AVG(rating), 1) FROM ratings ra WHERE ra.route_id = r.id) AS rating FROM routes r ' +
                'INNER JOIN users u ON r.setter_id = u.account_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.toprope_grade_id = rg.id ' +
                'LEFT JOIN rope_grades lg ON r.lead_grade_id = lg.id ' +
                'WHERE w.gym_id = ?',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };


    // TODO: use this when navigating to a gym to download all the route data at once.
    this.getRoutesInGym2 = function (pUserId, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.active, r.id AS route_id, r.wall_id, w.gym_id, r.type, (SELECT s.route_id FROM sends s WHERE s.route_id = r.id AND s.user_id = ?) AS sent, (SELECT p.route_id FROM projects p WHERE p.route_id = r.id AND p.user_id = ?) AS project, r.setter_id, w.gym_id, w.name AS wall_name, w.id AS wall_id, r.lead_grade_id, lg.name AS lead_grade, r.name AS route_name, bg.name AS boulder_grade, rg.name AS toprope_grade, bg.id AS boulder_grade_id, rg.id AS toprope_grade_id, c.name AS color, c.value AS value, CONCAT(u.firstname, \' \', u.lastname) AS setter, r.date, ' +
                '(SELECT COUNT(*) FROM sends s WHERE s.route_id = r.id) AS sends, ' +
                '(SELECT ROUND(AVG(rating), 1) FROM ratings ra WHERE ra.route_id = r.id) AS rating FROM routes r ' +
                'INNER JOIN users u ON r.setter_id = u.account_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.toprope_grade_id = rg.id ' +
                'LEFT JOIN rope_grades lg ON r.lead_grade_id = lg.id ' +
                'WHERE w.gym_id = ? AND r.active = true',
            [pUserId, pUserId, pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getRoutesOnWall = function (pUserId, pWallId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, lg.name AS lead_grade, r.id AS route_id, r.wall_id, w.gym_id, lg.id AS lead_grade_id, (SELECT ROUND(AVG(rating), 1) FROM ratings ra WHERE ra.route_id = r.id) AS rating, (SELECT true FROM sends s WHERE s.route_id = r.id AND s.user_id = ?) AS send, (SELECT COUNT(*) FROM sends s WHERE s.route_id = r.id) AS send_count, (SELECT rntu.id FROM route_new_to_user rntu WHERE rntu.route_id = r.id AND rntu.user_id = ?) AS isNew, r.name AS route_name, bg.name AS boulder_grade, rg.name AS toprope_grade, c.name AS color, c.value AS value, u.firstname, u.lastname, r.date FROM routes r ' +
                'INNER JOIN users u ON r.setter_id = u.account_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.toprope_grade_id = rg.id ' +
                'LEFT JOIN rope_grades lg ON r.lead_grade_id = lg.id ' +
                'WHERE r.wall_id = ? AND r.active = 1 ORDER BY bg.id ASC, rg.id ASC',
            [pUserId, pUserId, pWallId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createRoute = function (pWallId, pName, pSetterId, pType, pBoulderGradeId, pTopRopeGradeId, pLeadGradeId, pColorId, pNote, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO routes (wall_id, name, setter_id, type, boulder_grade_id, lead_grade_id, toprope_grade_id, color_id, note, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
            [pWallId, pName, pSetterId, pType, pBoulderGradeId, pLeadGradeId, pTopRopeGradeId, pColorId, pNote],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.updateRoute = function (pRouteId, pName, pSetterId, pType, pBoulderGradeId, pTopRopeGradeId, pLeadGradeId, pColorId, pNote, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE routes SET name = ?, setter_id = ?, type = ?, boulder_grade_id = ?, lead_grade_id = ?, toprope_grade_id = ?, color_id = ?, note = ? WHERE id = ?',
            [pName, pSetterId, pType, pBoulderGradeId, pLeadGradeId, pTopRopeGradeId, pColorId, pNote, pRouteId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.deleteRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM routes WHERE id = ?',
            [pRouteId],
            theDaoHelper.DELETE,
            pCallback
        );
    };

    this.stripRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE routes SET active = 0 WHERE id = ?',
            [pRouteId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

};

module.exports = new RoutesDao();
