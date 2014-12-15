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

var FeedbackDao = function () {
    'use strict';

    this.createFeedback = function (pName, pMessage, pCallback) {
        theDaoHelper.executeQuery(
            "INSERT INTO feedback (name, message) values (?, ?)",
            [pName, pMessage],
            theDaoHelper.INSERT,
            pCallback
        );
    };
};

module.exports = new FeedbackDao();
