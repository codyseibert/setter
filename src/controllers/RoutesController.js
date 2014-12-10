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
var theControllerHelper = require('./ControllerHelper');

var RoutesController = function () {
    'use strict';

    this.getRoute = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.getRoute(id, callback);
    };

    this.getRoutesInSet = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.getRoutesInSet(id, callback);
    };

    this.createRoute = function (pReq, pRes) {
        var setId,
            name,
            gradeId,
            setterId,
            colorId,
            callback;
        setId = pReq.body.set_id;
        name = pReq.body.name;
        gradeId = pReq.body.grade_id;
        setterId = pReq.body.setter_id;
        colorId = pReq.body.color_id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.createRoute(setId, name, setterId, gradeId, colorId, callback);
    };

    this.updateRoute = function (pReq, pRes) {
        var setId,
            name,
            gradeId,
            setterId,
            colorId,
            callback,
            routeId;
        routeId = pReq.params.id;
        setId = pReq.body.set_id;
        name = pReq.body.name;
        gradeId = pReq.body.grade_id;
        setterId = pReq.body.setter_id;
        colorId = pReq.body.color_id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.updateRoute(routeId, setId, name, setterId, gradeId, colorId, callback);
    };

    this.deleteRoute = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.deleteRoute(id, callback);
    };
};

module.exports = new RoutesController();
