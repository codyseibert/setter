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
SettersDao

Contains logic related to Setters.
*/
var SettersDao = function () {
    'use strict';

    this.getSetter = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id, firstname, lastname FROM setters WHERE id = ?',
            [pId],
            pCallback
        );
    };

    this.getSetters = function (pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id, firstname, lastname FROM setters',
            [],
            pCallback
        );
    };

    this.createSetter = function (pAccountId, pFirstname, pLastname, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO setters (account_id, firstname, lastname) VALUES (?, ?, ?)',
            [pAccountId, pFirstname, pLastname],
            pCallback
        );
    };

    this.updateSetter = function (pId, pFirstname, pLastname, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE setters SET firstname = ? AND address = ? WHERE id = ?',
            [pFirstname, pLastname, pId],
            pCallback
        );
    };

    this.deleteSetter = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM setters WHERE id = ?',
            [pId],
            pCallback
        );
    };
};

module.exports = new SettersDao();
