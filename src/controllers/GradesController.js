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

var theGradesDao = require('../dao/GradesDao');
var theControllerHelper = require('./ControllerHelper');

var GradesController = function () {
    'use strict';

    /*
        Sends back the boulder grades (v0, v1,..., v2) from datastore

        $method getBoulderGrades
    */
    this.getBoulderGrades = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theGradesDao.getBoulderGrades(callback);
    };

    /*
        Sends back the rope grades (5.6, 5.7,.., 5.15) from datastore

        $method getBoulderGrades
    */
    this.getRopeGrades = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theGradesDao.getRopeGrades(callback);
    };
};

module.exports = new GradesController();
