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

var theSendsDao = require('../dao/SendsDao');
var theControllerHelper = require('./ControllerHelper');

var SendsController = function () {
    'use strict';

    this.getSendsForRoute = function (pReq, pRes) {
        var routeId,
            callback;
        routeId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSendsDao.getSendsForRoute(routeId, callback);
    };

    this.createSend = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        userId = pReq.user.id;
        routeId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSendsDao.createSend(userId, routeId, callback);
    };

    this.deleteSend = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        userId = pReq.user.id;
        routeId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSendsDao.deleteSend(userId, routeId, callback);
    };
};

module.exports = new SendsController();
