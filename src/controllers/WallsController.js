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
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.getWallsInGym(gymId, callback);
    };

    this.createWall = function (pReq, pRes) {
        var wallName,
            gymId,
            callback;
        wallName = pReq.body.wallName;
        gymId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.createWall(wallName, gymId, callback);
    };

    this.updateWall = function (pReq, pRes) {
        var wallName,
            wallId,
            callback;
        wallName = pReq.body.wallName;
        wallId = pReq.params.wallId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.updateWall(wallId, wallName, callback);
    };

    this.deleteWall = function (pReq, pRes) {
        var wallId,
            callback;
        wallId = pReq.params.wallId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.deleteWall(wallId, callback);
    };
};

module.exports = new WallsController();
