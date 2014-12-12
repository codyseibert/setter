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
var GradesDao = function () {
    'use strict';

    /**
        Retreieves the boulder grades from the database.

        $method getGrades
        $param pCallback invoked on success or failure.
    */
    this.getBoulderGrades = function (pCallback) {
        theDaoHelper.executeQuery(
            "SELECT id, name FROM boulder_grades",
            [],
            pCallback
        );
    };

    /**
        Retreieves the rope grades from the database.

        $method getGrades
        $param pCallback invoked on success or failure.
    */
    this.getRopeGrades = function (pCallback) {
        theDaoHelper.executeQuery(
            "SELECT id, name FROM rope_grades",
            [],
            pCallback
        );
    };
};

module.exports = new GradesDao();
