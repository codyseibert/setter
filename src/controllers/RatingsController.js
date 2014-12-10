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

var RoutesController = function () {
    'use strict';

    this.updateRating = function (pReq, pRes) {
        var userId,
            routeId,
            value,
            callback;
        userId = pReq.user.id;
        routeId = pReq.params.id;
        value = pReq.body.value;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRatingsDao.updateRating(userId, routeId, value, callback);
    };
};

module.exports = new RoutesController();
