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
var theProjectsDao = require('../dao/ProjectsDao');
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

    this.getLatestProjects = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theProjectsDao.getLatestProjectsForGym(gymId, callback);
    };

    this.getGymSettings = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGymSettings(gymId, callback);
    };

    this.getGymImage = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGymImage(gymId, callback);
    };

    this.getDistributions = function (pReq, pRes) {
        var gymId,
            type,
            callback;
        gymId = pReq.params.gymId;
        type = pReq.params.type;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getDistributions(gymId, type, callback);
    };

    this.getGymUsersGrades = function (pReq, pRes) {
        var gymId,
            type,
            callback;
        gymId = pReq.params.gymId;
        type = pReq.params.type;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGymUsersGrades(gymId, type, callback);
    };


    this.getAllCurrentRoutes = function (pReq, pRes) {
        var gymId,
            accountId,
            callback;
        gymId = pReq.params.gymId;
        accountId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getAllCurrentRoutes(accountId, gymId, callback);
    };

    this.getCurrentBoulderRoutes = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getCurrentBoulderRoutes(gymId, callback);
    };

    this.getCurrentTopRopeRoutes = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getCurrentTopRopeRoutes(gymId, callback);
    };

    this.getCurrentLeadRoutes = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getCurrentLeadRoutes(gymId, callback);
    };





    this.getBoulderRouteDistribution = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getBoulderRouteDistribution(gymId, callback);
    };

    this.getTopRopeRouteDistribution = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getTopRopeRouteDistribution(gymId, callback);
    };

    this.getLeadRouteDistribution = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getLeadRouteDistribution(gymId, callback);
    };




    this.getBestRatedBoulder = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getBestRatedBoulder(gymId, callback);
    };

    this.getBestRatedTopRope = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getBestRatedTopRope(gymId, callback);
    };

    this.getBestRatedLead = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getBestRatedLead(gymId, callback);
    };




    this.getNewestBoulder = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getNewestBoulder(gymId, callback);
    };

    this.getNewestTopRope = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getNewestTopRope(gymId, callback);
    };

    this.getNewestLead = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getNewestLead(gymId, callback);
    };


    this.getLatestComments = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getLatestComments(gymId, callback);
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
