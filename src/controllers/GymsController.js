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
};

module.exports = new GymsController();
