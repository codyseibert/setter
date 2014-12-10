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
};

module.exports = new SendsDao();
