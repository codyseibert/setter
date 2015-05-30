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

var ProjectsDao = function () {
    'use strict';

    this.getProjectsForRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT u.account_id, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url, p.route_id FROM projects p ' +
                'INNER JOIN users u ON u.account_id = p.user_id ' +
                'INNER JOIN accounts a ON a.id = u.account_id ' +
                'LEFT JOIN sends s ON s.route_id = p.route_id AND s.user_id = p.user_id ' +
                'LEFT JOIN images i ON a.image_id = i.id ' +
                'WHERE p.route_id = ? AND s.route_id is null',
            [pRouteId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getLatestProjectsForGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.type, r.id AS route_id, u.account_id, CONCAT(u.firstname, \' \', u.lastname) AS name, i.url, r.wall_id, w.gym_id, r.name AS route_name, r.setter_id, w.name AS wall_name, r.boulder_grade_id, lg.name AS lead_grade, r.lead_grade_id, r.toprope_grade_id, r.color_id, lg.name AS lead_grade, bg.name AS boulder_grade, rg.name AS toprope_grade, c.name AS color, c.value AS value, r.date, r.note FROM routes r ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'INNER JOIN projects p ON p.route_id = r.id ' +
                'INNER JOIN users u ON u.account_id = p.user_id ' +
                'INNER JOIN accounts a ON a.id = u.account_id ' +
                'LEFT JOIN images i ON a.image_id = i.id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.toprope_grade_id = rg.id ' +
                'LEFT JOIN rope_grades lg ON r.lead_grade_id = lg.id ' +
                'WHERE w.gym_id = ? AND r.active = true',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getProjectsForUser = function (pUserId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.type, r.id AS route_id, s.route_id AS sent, r.wall_id, w.gym_id, r.name AS route_name, r.setter_id, w.name AS wall_name, r.boulder_grade_id, lg.name AS lead_grade, r.lead_grade_id, r.toprope_grade_id, r.color_id, lg.name AS lead_grade, bg.name AS boulder_grade, rg.name AS toprope_grade, c.name AS color, c.value AS value, r.date, r.note FROM projects p ' +
                'INNER JOIN routes r ON r.id = p.route_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'LEFT JOIN sends s ON s.route_id = p.route_id AND s.user_id = p.user_id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.toprope_grade_id = rg.id ' +
                'LEFT JOIN rope_grades lg ON r.lead_grade_id = lg.id ' +
                'WHERE p.user_id = ?',
            [pUserId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.isProject = function (pUserId, pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id FROM projects WHERE user_id = ? AND route_id = ?',
            [pUserId, pRouteId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.createProject = function (pUserId, pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO projects (user_id, route_id, date) VALUES (?, ?, NOW())',
            [pUserId, pRouteId],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.deleteProject = function (pUserId, pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM projects WHERE user_id = ? AND route_id = ?',
            [pUserId, pRouteId],
            theDaoHelper.DELETE,
            pCallback
        );
    };

};

module.exports = new ProjectsDao();
