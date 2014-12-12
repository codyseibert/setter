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

    this.getWalls = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.getWalls(gymId, callback);
    };

    this.createWall = function (pReq, pRes) {
        var name,
            gymId,
            callback;
        name = pReq.body.name;
        gymId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.createWall(name, gymId, callback);
    };

    this.updateWall = function (pReq, pRes) {
        var name,
            wallId,
            callback;
        name = pReq.body.name;
        wallId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.updateWall(wallId, name, callback);
    };

    this.deleteWall = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theWallsDao.deleteWall(id, callback);
    };
};

module.exports = new WallsController();
