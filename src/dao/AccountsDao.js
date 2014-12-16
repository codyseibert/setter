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
    AccountsDao

    Used for accessing any information related to the accounts.
*/
var AccountsDAO = function () {
    'use strict';

    /**
        $method addAccount
        $param pEmail the email of the account
        $param pPassword the password of the account
        $param pCallback invoked on success or failure.
    */
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

    /**
        $method getAccountId
        $param pEmail the email of the account
        $param pPassword the password of the account
        $param pCallback invoked on success or failure.
    */
    this.getAccountId = function (pEmail, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id, password FROM accounts WHERE email = ?',
            [pEmail],
            theDaoHelper.SINGLE,
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

    /**
        $method getAccountType
        $param pAccountId the id of the account to check
        $param pCallback invoked on success or failure.
    */
    this.getAccountType = function (pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT type_id FROM accounts WHERE id = ?',
            [pAccountId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getAccountInfo = function (pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT u.gym_id, a.id, u.firstname, u.lastname, g.name, g.address, a.type_id FROM accounts a ' +
                'LEFT JOIN users u ON u.account_id = a.id ' +
                'LEFT JOIN gyms g ON g.account_id = a.id ' +
                'WHERE a.id = ?',
            [pAccountId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };
};

module.exports = new AccountsDAO();
