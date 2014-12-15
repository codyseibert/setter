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

var theFeedbackDao = require('../dao/FeedbackDao');
var theControllerHelper = require('./ControllerHelper');

var FeedbackController = function () {
    'use strict';

    this.createFeedback = function (pReq, pRes) {
        var name,
            message,
            callback;
        name = pReq.body.name;
        message = pReq.body.message;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theFeedbackDao.createFeedback(name, message, callback);
    };
};

module.exports = new FeedbackController();
