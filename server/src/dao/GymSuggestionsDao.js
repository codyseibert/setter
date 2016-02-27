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

var GymSuggestionsDao = function () {
    'use strict';

    this.getSuggestionsForGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT s.id, i.url, CONCAT(u.firstname, \' \', u.lastname) AS name, s.user_id, s.message, s.read, s.date FROM gym_suggestions s ' +
                'INNER JOIN users u ON u.account_id = s.user_id ' +
                'INNER JOIN accounts a ON a.id = u.account_id ' +
                'LEFT JOIN images i ON i.id = a.image_id ' +
                'WHERE s.gym_id = ? ORDER BY s.date DESC',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createSuggestion = function (pGymId, pUserId, pMessage, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO gym_suggestions (gym_id, user_id, message, date) VALUES (?, ?, ?, NOW())',
            [pGymId, pUserId, pMessage],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.markAsRead = function (pSuggestionId, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE gym_suggestions SET `read` = 1 WHERE id = ?',
            [pSuggestionId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };
};

module.exports = new GymSuggestionsDao();
