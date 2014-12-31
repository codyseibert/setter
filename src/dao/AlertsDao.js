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

var AlertsDao = function () {
    'use strict';

    this.getAlertsForGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            "SELECT id, message, date FROM alerts WHERE gym_id = ? ORDER BY date DESC LIMIT 5",
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createAlert = function (pGymId, pMessage, pCallback) {
        console.log("ALERTS", pGymId, pMessage);
        theDaoHelper.executeQuery(
            "INSERT INTO alerts (gym_id, message, date) VALUES (?, ?, NOW())",
            [pGymId, pMessage],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.deleteAlert = function (pAlertId, pCallback) {
        theDaoHelper.executeQuery(
            "DELETE FROM alerts WHERE id = ?",
            [pAlertId],
            theDaoHelper.DELETE,
            pCallback
        );
    }
};

module.exports = new AlertsDao();
