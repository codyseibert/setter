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
    UsersDao

    Contains logic related to users.
*/
var UsersDao = function () {
    'use strict';

    this.getUser = function (pUserId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id, firstname, lastname FROM users WHERE account_id = ?',
            [pUserId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getUsers = function (pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id, firstname, lastname FROM users',
            [],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createUser = function (pAccountId, pFirstname, pLastname, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO users (account_id, firstname, lastname) VALUES (?, ?, ?)',
            [pAccountId, pFirstname, pLastname],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.getBoulderSends = function (pUserId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT bg.value, bg.name, s.date FROM sends s ' +
                'INNER JOIN routes r ON s.route_id = r.id ' +
                'INNER JOIN boulder_grades bg ON r.boulder_grade_id = bg.id WHERE s.user_id = ?',
            [pUserId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getRopeSends = function (pUserId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT rg.value, rg.name, s.date FROM sends s ' +
                'INNER JOIN routes r ON s.route_id = r.id ' +
                'INNER JOIN rope_grades rg ON r.rope_grade_id = rg.id WHERE s.user_id = ?',
            [pUserId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

};

module.exports = new UsersDao();
