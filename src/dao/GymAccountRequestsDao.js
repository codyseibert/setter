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

var GymAccountsRequestsDao = function () {
    'use strict';

    this.createGymAccountRequest = function (pEmail, pName, pAddress, pCallback) {
        theDaoHelper.executeQuery(
            "INSERT INTO gym_account_requests (email, name, address) VALUES (?, ?, ?)",
            [pEmail, pName, pAddress],
            theDaoHelper.INSERT,
            pCallback
        );
    };
};

module.exports = new GymAccountsRequestsDao();
