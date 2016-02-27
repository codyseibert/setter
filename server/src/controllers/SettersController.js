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

var theSettersDao = require('../dao/SettersDao');
var theControllerHelper = require('./ControllerHelper');

var SettersController = function () {
    'use strict';

    this.getSettersAtGym = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.getSettersAtGym(gymId, callback);
    };

    this.getUsers = function (pReq, pRes) {
        var callback,
            gymId;
        gymId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.getUsers(gymId, callback);
    };

    this.createSetterGymAccess = function (pReq, pRes) {
        var callback,
            gymId,
            setterId;
        gymId = pReq.user.accountId;
        setterId = pReq.body.setterId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.createSetterGymAccess(setterId, gymId, callback);
    };

    this.deleteSetterGymAccess = function (pReq, pRes) {
        var callback,
            gymId,
            setterId;
        gymId = pReq.user.accountId;
        setterId = pReq.params.setterId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.deleteSetterGymAccess(setterId, gymId, callback);
    };
};

module.exports = new SettersController();
