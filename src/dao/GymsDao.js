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

    this.getGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id, name, address FROM gyms WHERE account_id = ?',
            [pGymId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getGyms = function (pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id, name, address FROM gyms',
            [],
            theDaoHelper.MULTIPLE,
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

    this.getCurrentRopeRoutes = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT rg.name, rg.value FROM routes r ' +
                'INNER JOIN walls w ON w.id = r.wall_id ' +
                'INNER JOIN rope_grades rg ON r.rope_grade_id = rg.id WHERE w.gym_id = ? AND r.active = 1',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };
};

module.exports = new GymsDao();
