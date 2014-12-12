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

    this.getUser = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id, firstname, lastname FROM users WHERE id = ?',
            [pId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getUsers = function (pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id, firstname, lastname FROM users',
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

    this.updateUser = function (pId, pFirstname, pLastname, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE users SET firstname = ? AND address = ? WHERE id = ?',
            [pFirstname, pLastname, pId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.deleteUser = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM users WHERE id = ?',
            [pId],
            theDaoHelper.DELETE,
            pCallback
        );
    };
};

module.exports = new UsersDao();
