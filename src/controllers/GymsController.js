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

var theGymsDao = require('../dao/GradesDao');
var theControllerHelper = require('./ControllerHelper');

var GymsController = function () {
    'use strict';

    this.getGym = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGym(gymId, callback);
    };

    this.getGyms = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.getGyms(callback);
    };

    this.createGym = function (pReq, pRes) {
        var name,
            address,
            callback;
        name = pReq.body.name;
        address = pReq.body.address;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.createGym(name, address, callback);
    };

    this.updateGym = function (pReq, pRes) {
        var id,
            name,
            address,
            callback;
        id = pReq.params.id;
        name = pReq.body.name;
        address = pReq.body.address;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.updateGym(id, name, address, callback);
    };

    this.deleteGym = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymsDao.deleteGym(id, callback);
    };
};

module.exports = new GymsController();
