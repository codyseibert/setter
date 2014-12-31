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

var theAlertsDao = require('../dao/AlertsDao');
var theControllerHelper = require('./ControllerHelper');

var AlertsController = function () {
    'use strict';

    this.getAlertsForGym = function (pReq, pRes) {
        var gymId,
            callback;
        gymId = pReq.params.gymId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theAlertsDao.getAlertsForGym(gymId, callback);
    };

    this.createAlert = function (pReq, pRes) {
        var gymId,
            message,
            callback;
        gymId = pReq.params.gymId;
        message = pReq.body.message;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theAlertsDao.createAlert(gymId, message, callback);
    };

    this.deleteAlert = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.alertId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theAlertsDao.deleteAlert(id, callback);
    };
};

module.exports = new AlertsController();
