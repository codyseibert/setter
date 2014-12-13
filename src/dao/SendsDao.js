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

var SendsDao = function () {
    'use strict';

    this.getSendsForRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT u.id, u.firstname, u.lastname, s.route_id FROM sends s ' +
                'INNER JOIN users u ON u.id = s.user_id WHERE s.route_id = ?',
            [pRouteId],
            pCallback
        );
    };

    this.createSend = function (pUserId, pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO sends (user_id, route_id, date) VALUES (?, ?, NOW())',
            [pUserId, pRouteId],
            pCallback
        );
    };

    this.deleteSend = function (pUserId, pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM sends WHERE user_id = ? AND route_id = ?',
            [pUserId, pRouteId],
            pCallback
        );
    };

    this.getBoulderRoutesSentByUser = function (pUserId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.name, g.name, c.name FROM sends s ' +
                'INNER JOIN routes r ON r.id = s.route_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'INNER JOIN boulder_grades g ON r.grade_id = g.id WHERE s.user_id = ?',
            [pUserId],
            pCallback
        );
    };
};

module.exports = new SendsDao();
