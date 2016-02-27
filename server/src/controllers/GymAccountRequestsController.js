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

var theGymAccountRequestsDao = require('../dao/GymAccountRequestsDao');
var theControllerHelper = require('./ControllerHelper');

var GymAccountRequestsController = function () {
    'use strict';

    this.createGymAccountRequest = function (pReq, pRes) {
        var email,
            name,
            address,
            callback;
        email = pReq.body.email;
        name =  pReq.body.name;
        address = pReq.body.address;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theGymAccountRequestsDao.createGymAccountRequest(email, name, address, callback);
    };
};

module.exports = new GymAccountRequestsController();
