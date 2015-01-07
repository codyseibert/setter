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

var SettersDao = function () {
    'use strict';

    this.getSettersAtGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT i.url, u.account_id, CONCAT(u.firstname, \' \', u.lastname) AS name, u.firstname, u.lastname, ' +
                '(SELECT COUNT(*) FROM routes r WHERE r.setter_id = u.account_id AND r.boulder_grade_id IS NOT NULL) AS num_boulder_routes, ' +
                '(SELECT COUNT(*) FROM routes r WHERE r.setter_id = u.account_id AND r.rope_grade_id IS NOT NULL) AS num_rope_routes, ' +
                '(SELECT ROUND(AVG(ra.rating), 1) FROM ratings ra INNER JOIN routes r ON r.id = ra.route_id WHERE r.setter_id = u.account_id) AS rating ' +
                'FROM setters_gyms_access sga ' +
                'INNER JOIN users u ON u.account_id = sga.setter_id ' +
                'INNER JOIN accounts a ON a.id = u.account_id ' +
                'LEFT JOIN images i ON a.image_id = i.id ' +
                'WHERE sga.gym_id = ?',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getUsers = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT i.url, u.account_id, u.firstname, u.lastname FROM users u ' +
                'INNER JOIN accounts a ON a.id = u.account_id ' +
                'LEFT JOIN images i ON i.id = a.image_id ' +
                'WHERE account_id NOT IN (SELECT setter_id FROM setters_gyms_access WHERE gym_id = ?)',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createSetterGymAccess = function (pSetterId, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO setters_gyms_access (setter_id, gym_id) values (?, ?)',
            [pSetterId, pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.deleteSetterGymAccess = function (pSetterId, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM setters_gyms_access WHERE setter_id = ? AND gym_id = ?',
            [pSetterId, pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };
};

module.exports = new SettersDao();
