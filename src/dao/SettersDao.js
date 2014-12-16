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
            'SELECT u.account_id as id, CONCAT(u.firstname, \' \', u.lastname) AS name, u.firstname, u.lastname FROM setters_gyms_access sga ' +
                'INNER JOIN users u ON u.account_id = sga.setter_id WHERE sga.gym_id = ?',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getUsers = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id AS id, firstname, lastname FROM users WHERE account_id NOT IN (SELECT setter_id FROM setters_gyms_access WHERE gym_id = ?)',
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
