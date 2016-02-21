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

var theWallsDao = require('../dao/WallsDao');
var theControllerHelper = require('./ControllerHelper');

var WallsController = function () {
    'use strict';

    this.getWallsInGym = function (pReq, pRes) {
        var gymId,
            accountId,
            callback;
        gymId = pReq.params.gymId;
        accountId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.getWallsInGym(gymId, accountId, callback);
    };

    this.getWall = function (pReq, pRes) {
        var wallId,
            callback;
        wallId = pReq.params.wallId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.getWall(wallId, callback);
    };

    this.createWall = function (pReq, pRes) {
        var wallName,
            gymId,
            zoneType,
            callback;
        zoneType = pReq.body.zoneType;
        wallName = pReq.body.wallName;
        gymId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.createWall(wallName, zoneType, gymId, callback);
    };

    this.updateWall = function (pReq, pRes) {
        var gymId,
            wallName,
            wallId,
            callback;
        gymId = pReq.user.accountId;
        wallName = pReq.body.wallName;
        wallId = pReq.params.wallId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.updateWall(gymId, wallId, wallName, callback);
    };

    this.deleteWall = function (pReq, pRes) {
        var gymId,
            wallId,
            callback;
        gymId = pReq.user.accountId;
        wallId = pReq.params.wallId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.deleteWall(gymId, wallId, callback);
    };

    this.stripZone = function (pReq, pRes) {
        var wallId,
            callback;
        wallId = pReq.params.wallId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.stripZone(wallId, callback);
    };
};

module.exports = new WallsController();
