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

    this.getSetter = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.getSetter(id, callback);
    };

    this.getSetters = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.getSetters(callback);
    };

    this.createSetter = function (pReq, pRes) {
        var firstname,
            lastname,
            callback;
        firstname = pReq.body.firstname;
        lastname = pReq.body.lastname;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.createSetter(firstname, lastname, callback);
    };

    this.updateSetter = function (pReq, pRes) {
        var id,
            firstname,
            lastname,
            callback;
        id = pReq.params.id;
        firstname = pReq.body.firstname;
        lastname = pReq.body.lastname;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.updateSetter(id, firstname, lastname, callback);
    };

    this.deleteSetter = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSettersDao.deleteSetter(id, callback);
    };
};

module.exports = new SettersController();
