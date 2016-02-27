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

var AccountsDAO = function () {
    'use strict';

    this.createAccount = function (pEmail, pPassword, pTypeId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO accounts (email, password, type_id) VALUES (?, ?, ?)',
            [pEmail, pPassword, pTypeId],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.setToken = function (pAccountId, pToken, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE accounts SET token = ? WHERE id = ?',
            [pToken, pAccountId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.getAccountId = function (pEmail, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id, password FROM accounts WHERE email = ?',
            [pEmail],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.updatePassword = function (pAccountId, pPassword, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE accounts SET password = ? WHERE id = ?',
            [pPassword, pAccountId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.getAccountIdViaToken = function (pToken, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id FROM accounts WHERE token = ?',
            [pToken],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getAccountIdUsingEmail = function (pEmail, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id FROM accounts WHERE email = ?',
            [pEmail],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getSettings = function (pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT hide_setters, facebook FROM gyms WHERE account_id = ?',
            [pAccountId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.updateSettings = function (pAccountId, pSettings, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE gyms SET hide_setters = ?, facebook = ? WHERE account_id = ?',
            [pSettings.hide_setters, pSettings.facebook, pAccountId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.getAccountType = function (pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT type_id FROM accounts WHERE id = ?',
            [pAccountId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getAccountInfo = function (pAccountId, pCallback) {
        var that = this;
        theDaoHelper.executeQuery(
            'SELECT i.url, CONCAT(u.firstname, \' \', u.lastname) AS fullname, a.email, u.gym_id, a.id, u.firstname, u.lastname, g.name, g.address, a.type_id, a.token FROM accounts a ' +
                'LEFT JOIN users u ON u.account_id = a.id ' +
                'LEFT JOIN gyms g ON g.account_id = a.id ' +
                'LEFT JOIN images i ON i.id = a.image_id ' +
                'WHERE a.id = ?',
            [pAccountId],
            theDaoHelper.SINGLE,
            function (info) {
                that.getGymAccessList(pAccountId, function (gyms) {
                    info.gyms = gyms.map(function(gym) { return gym.account_id; });
                    pCallback(info)
                });
            }
        );

    };

    this.getGymAccessList = function (pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT g.account_id FROM gyms g ' +
                'INNER JOIN setters_gyms_access sga ON sga.gym_id = g.account_id ' +
                'WHERE sga.setter_id = ?',
            [pAccountId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.updateImage = function (pImageId, pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE accounts SET image_id = ? WHERE id = ?',
            [pImageId, pAccountId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };
};

module.exports = new AccountsDAO();
