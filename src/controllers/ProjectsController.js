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

var theRoutesDao = require('../dao/RoutesDao');
var theProjectsDao = require('../dao/ProjectsDao');
var theUsersDao = require('../dao/UsersDao');
var theControllerHelper = require('./ControllerHelper');

var ProjectsController = function () {
    'use strict';

    this.getProjectsForRoute = function (pReq, pRes) {
        var routeId,
            callback;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theProjectsDao.getProjectsForRoute(routeId, callback);
    };

    this.getProjectsForUser = function (pReq, pRes) {
        var userId,
            callback;
        userId = pReq.params.userId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theProjectsDao.getProjectsForUser(userId, callback);
    };

    this.isProject = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        routeId = pReq.params.routeId;
        userId = pReq.user.accountId;
        callback = theControllerHelper.createNoStatusDefaultCallback(pRes);
        theProjectsDao.isProject(userId, routeId, callback);
    };

    this.createProject = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        userId = pReq.user.accountId;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theProjectsDao.createProject(userId, routeId, callback);
    };

    this.deleteProject = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        userId = pReq.user.accountId;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theProjectsDao.deleteProject(userId, routeId, callback);
    };
};

module.exports = new ProjectsController();
