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

var theColorsDao = require('../dao/ColorsDao');
var theControllerHelper = require('./ControllerHelper');

var ColorsController = function () {
    'use strict';

    this.getColors = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theColorsDao.getColors(callback);
    };
};

module.exports = new ColorsController();
