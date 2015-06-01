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

        theDaoHelper.executeQuery(
            "INSERT INTO alerts (gym_id, message, date) VALUES (?, ?, NOW())",
            [pGymId, pMessage],
            theDaoHelper.INSERT,
            function (pAlert) {
                theDaoHelper.executeQuery(
                    "SELECT * FROM users WHERE gym_id = ?",
                    [pGymId],
                    theDaoHelper.MULTIPLE,
                    function (pUsers) {
                        for (var i = 0; i < pUsers.length; i++) {
                            var user = pUsers[i];
                            theDaoHelper.executeQuery(
                                "INSERT INTO alerts_users (user_id, alert_id) VALUES (?, ?)",
                                [user.account_id, pAlert.id],
                                theDaoHelper.INSERT,
                                function () {}
                            );
                        }
                    }
                );

                pCallback(pAlert);
            }
        );
    };

    this.deleteAlert = function (pAlertId, pCallback) {
        theDaoHelper.executeQuery(
            "DELETE FROM alerts WHERE id = ?",
            [pAlertId],
            theDaoHelper.DELETE,
            pCallback
        );
    };

    this.getAlertsForUser = function (pUserId, pCallback) {
        console.log(pUserId);
        theDaoHelper.executeQuery(
            "SELECT a.message, a.date FROM alerts_users au " +
            "INNER JOIN alerts a ON au.alert_id = a.id " +
            "WHERE au.user_id = ?",
            [pUserId],
            theDaoHelper.MULTIPLE,
            function (pData) {
                console.log(pData);
                theDaoHelper.executeQuery(
                    "DELETE FROM alerts_users WHERE user_id = ?",
                    [pUserId],
                    theDaoHelper.DELETE,
                    function () {}
                );
                pCallback(pData);
            }
        );
    };
};

module.exports = new AlertsDao();
