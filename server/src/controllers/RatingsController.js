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

var theRatingsDao = require('../dao/RatingsDao');
var theControllerHelper = require('./ControllerHelper');

var RatingsController = function () {
    'use strict';

    this.getRatingsForRoute = function (pReq, pRes) {
        var routeId,
            callback;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRatingsDao.getRatingForRoute(routeId, callback);
    };

    this.updateRating = function (pReq, pRes) {
        var userId,
            routeId,
            rating,
            callback;
        userId = pReq.user.accountId;
        routeId = pReq.params.routeId;
        rating = pReq.body.rating;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRatingsDao.updateRating(userId, routeId, rating, callback);
    };

    this.hasRated = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        userId = pReq.user.accountId;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createNoStatusDefaultCallback(pRes);
        theRatingsDao.hasRated(userId, routeId, callback);
    };
};

module.exports = new RatingsController();
