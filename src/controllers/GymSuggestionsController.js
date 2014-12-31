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

var theGymSuggestionsDao = require('../dao/GymSuggestionsDao');
var theControllerHelper = require('./ControllerHelper');

var GymsSuggestionsController = function () {
    'use strict';

    this.getSuggestionsForGym = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymSuggestionsDao.getSuggestionsForGym(gymId, callback);
    };

    this.createSuggestion = function (pReq, pRes) {
        var gymId,
            userId,
            message,
            callback;
        gymId = pReq.params.gymId;
        userId = pReq.user.accountId;
        message = pReq.body.message;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymSuggestionsDao.createSuggestion(gymId, userId, message, callback);
    };

    this.markAsRead = function (pReq, pRes) {
        var suggestionId,
            callback;
        suggestionId = pReq.params.suggestionId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymSuggestionsDao.markAsRead(suggestionId, callback);
    };
};

module.exports = new GymsSuggestionsController();
