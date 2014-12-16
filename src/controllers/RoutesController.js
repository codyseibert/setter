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
        var routeId,
            callback;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.getRoute(routeId, callback);
    };

    this.getRoutesInSet = function (pReq, pRes) {
        var setId,
            callback;
        setId = pReq.params.setId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.getRoutesInSet(setId, callback);
    };

    this.createRoute = function (pReq, pRes) {
        var setId,
            name,
            boulderGradeId,
            ropeGradeId,
            setterId,
            colorId,
            callback,
            note;
        setId = pReq.params.setId;
        name = pReq.body.name || '';
        colorId = pReq.body.colorId;
        boulderGradeId = pReq.body.boulderGradeId;
        ropeGradeId = pReq.body.ropeGradeId;
        setterId = pReq.body.setterId;
        note = pReq.body.note || '';

        if (boulderGradeId === -1) {
            boulderGradeId = null;
        }

        if (ropeGradeId === -1) {
            ropeGradeId = null;
        }

        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.createRoute(setId, name, setterId, boulderGradeId, ropeGradeId, colorId, note, callback);
    };

    this.updateRoute = function (pReq, pRes) {
        var routeId,
            name,
            boulderGradeId,
            ropeGradeId,
            setterId,
            colorId,
            callback,
            note;
        routeId = pReq.params.routeId;
        name = pReq.body.name || '';
        colorId = pReq.body.colorId;
        boulderGradeId = pReq.body.boulderGradeId;
        ropeGradeId = pReq.body.ropeGradeId;
        setterId = pReq.body.setterId;
        note = pReq.body.note || '';

        if (boulderGradeId === -1) {
            boulderGradeId = null;
        }

        if (ropeGradeId === -1) {
            ropeGradeId = null;
        }

        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.updateRoute(routeId, name, setterId, boulderGradeId, ropeGradeId, colorId, note, callback);
    };

    this.deleteRoute = function (pReq, pRes) {
        var routeId,
            callback;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theRoutesDao.deleteRoute(routeId, callback);
    };
};

module.exports = new RoutesController();
