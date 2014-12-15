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

var SuggestionsDao = function () {
    'use strict';

    this.getSuggestions = function (pCallback) {
        theDaoHelper.executeQuery(
            "SELECT s.suggestion, (SELECT COUNT(*) FROM suggestions_upvotes su WHERE suggestion_id = s.id) AS upvotes FROM suggestions s",
            [],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createSuggestions = function (pAccountId, pSuggestion, pCallback) {
        theDaoHelper.executeQuery(
            "INSERT INTO suggestions (account_id, suggestion) VALUES (?, ?)",
            [pAccountId, pSuggestion],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.upvoteSuggestion = function (pAccountId, pSuggestionId, pCallback) {
        theDaoHelper.executeQuery(
            "INSERT INTO suggestions_upvotes (account_id, suggestion_id) VALUES (?, ?)",
            [pAccountId, pSuggestionId],
            theDaoHelper.INSERT,
            pCallback
        );
    };
};

module.exports = new SuggestionsDao();
