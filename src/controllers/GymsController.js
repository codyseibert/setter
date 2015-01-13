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

var theGymsDao = require('../dao/GymsDao');
var theControllerHelper = require('./ControllerHelper');

var GymsController = function () {
    'use strict';

    this.getGym = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGym(gymId, callback);
    };

    this.getGyms = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGyms(callback);
    };

    this.getGymImage = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGymImage(gymId, callback);
    };

    this.getCurrentBoulderRoutes = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getCurrentBoulderRoutes(gymId, callback);
    };

    this.getCurrentRopeRoutes = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getCurrentRopeRoutes(gymId, callback);
    };

    this.getRopeRouteDistribution = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getRopeRouteDistribution(gymId, callback);
    };

    this.getBoulderRouteDistribution = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getBoulderRouteDistribution(gymId, callback);
    };

    this.getTopRatedBoulder = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getTopRatedBoulder(gymId, callback);
    };

    this.getTopRatedRope = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getTopRatedRope(gymId, callback);
    };

    this.getNewestBoulder = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getNewestBoulder(gymId, callback);
    };


    this.getNewestRope = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getNewestRope(gymId, callback);
    };

    this.getHomeGymUsers = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getHomeGymUsers(gymId, callback);
    };

    this.getActivityStream = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getActivityStream(gymId, callback);
    };

    this.getNumberOfNewRoutes = function (pReq, pRes) {
        var gymId,
            accountId,
            callback;
        gymId = pReq.params.gymId;
        accountId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getNumberOfNewRoutes(gymId, accountId, callback);
    };
};

module.exports = new GymsController();
