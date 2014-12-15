/*jslint nomen: true */
/*jslint unparam: true*/

/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var theSuggestionsDao = require('../dao/SuggestionsDao');
var theControllerHelper = require('./ControllerHelper');

var SuggestionsController = function () {
    'use strict';

    this.getSuggestions = function (pReq, pRes) {
        var accountId,
            callback;
        accountId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSuggestionsDao.getSuggestions(accountId, callback);
    };

    this.createSuggestion = function (pReq, pRes) {
        var suggestion,
            accountId,
            callback;
        accountId = pReq.user.accountId;
        suggestion = pReq.body.suggestion;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSuggestionsDao.createSuggestion(accountId, suggestion, callback);
    };

    this.upvoteSuggestion = function (pReq, pRes) {
        var accountId,
            suggestionId,
            callback;
        accountId = pReq.user.accountId;
        suggestionId = pReq.params.suggestionId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSuggestionsDao.upvoteSuggestion(accountId, suggestionId, callback);
    };
};

module.exports = new SuggestionsController();
