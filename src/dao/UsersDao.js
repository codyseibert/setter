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

    this.getUserImage = function (pUserId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT url FROM images i ' +
                'LEFT JOIN accounts a ON i.id = a.image_id ' +
                'WHERE a.id = ?',
            [pUserId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getUsers = function (pCallback) {
        theDaoHelper.executeQuery(
            'SELECT i.url, a.id, u.firstname, u.lastname FROM users u' +
                'INNER JOIN accounts a ON a.id = u.account_id ' +
                'LEFT JOIN images i ON a.image_id = i.id',
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

    this.setHomeGym = function (pUserId, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE users SET gym_id = ? WHERE account_id = ?',
            [pGymId, pUserId],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.getActivityStream = function (pUserId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT a.id, c.value, s.date, bg.name AS bg, rg.name AS rg, CONCAT(u.firstname, \' \', u.lastname) AS name, w.gym_id, r.wall_id, s.route_id FROM users u ' +
                'INNER JOIN accounts a ON u.account_id = a.id ' +
                'INNER JOIN sends s ON s.user_id = a.id ' +
                'INNER JOIN routes r ON r.id = s.route_id ' +
                'INNER JOIN walls w ON r.wall_id = w.id ' +
                'INNER JOIN colors c ON c.id = r.color_id ' +
                'LEFT JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' +
                'LEFT JOIN rope_grades rg ON rg.id = r.rope_grade_id ' +
                'WHERE a.id = ? ORDER BY s.date DESC LIMIT 20',
            [pUserId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };
};

module.exports = new UsersDao();
