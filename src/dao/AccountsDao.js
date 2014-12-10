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
    this.addAccount = function (pEmail, pPassword, pCallback) {
        theDaoHelper.createQuery(
            'INSERT INTO accounts (email, password) VALUES (?, ?)',
            [pEmail, pPassword],
            pCallback
        );
    };

    /**
        $method getAccountId
        $param pEmail the email of the account
        $param pPassword the password of the account
        $param pCallback invoked on success or failure.
    */
    this.getAccountId = function (pEmail, pPassword, pCallback) {
        theDaoHelper.createQuery(
            'SELECT id FROM accounts WHERE email = ? AND password = ?',
            [pEmail, pPassword],
            pCallback
        );
    };

    /**
        $method getAccountType
        $param pAccountId the id of the account to check
        $param pCallback invoked on success or failure.
    */
    this.getAccountType = function (pAccountId, pCallback) {
        theDaoHelper.createQuery(
            'SELECT type_id FROM accounts WHERE id = ?',
            [pAccountId],
            pCallback
        );
    };
};

module.exports = new AccountsDAO();
