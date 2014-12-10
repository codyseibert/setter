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

var theSettersGymsAccessDao = require('../dao/SettersGymsAccessDao');
var theControllerHelper = require('./ControllerHelper');

var SettersGymsAccessController = function () {
    'use strict';

    this.getAccessList = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.user.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersGymsAccessDao.getAccessList(gymId, callback);
    };

    this.createAccess = function (pReq, pRes) {
        var gymId,
            setterId,
            callback;
        gymId = pReq.user.id;
        setterId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersGymsAccessDao.createAccess(setterId, gymId, callback);
    };

    this.deleteAccess = function (pReq, pRes) {
        var gymId,
            setterId,
            callback;
        gymId = pReq.user.id;
        setterId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersGymsAccessDao.deleteAccess(setterId, gymId, callback);
    };
};

module.exports = new SettersGymsAccessController();
