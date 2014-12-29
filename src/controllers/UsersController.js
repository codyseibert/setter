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

var theUsersDao = require('../dao/UsersDao');
var theRoutesDao = require('../dao/RoutesDao');
var theControllerHelper = require('./ControllerHelper');

var UsersController = function () {
    'use strict';

    this.getUser = function (pReq, pRes) {
        var userId,
            callback;
        userId = pReq.params.userId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.getUser(userId, callback);
    };

    this.getUserImage = function (pReq, pRes) {
        var userId,
            callback;
        userId = pReq.params.userId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.getUserImage(userId, callback);
    };

    this.getUsers = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.getUsers(callback);
    };

    this.getBoulderSends = function (pReq, pRes) {
        var userId,
            callback;
        userId = pReq.params.userId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.getBoulderSends(userId, callback);
    };

    this.getRopeSends = function (pReq, pRes) {
        var userId,
            callback;
        userId = pReq.params.userId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.getRopeSends(userId, callback);
    };

    this.setHomeGym = function (pReq, pRes) {
        var gymId,
            userId,
            callback;
        gymId = pReq.body.gymId;
        userId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.setHomeGym(userId, gymId, callback);
    };
};

module.exports = new UsersController();
