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

var theCommentsDao = require('../dao/CommentsDao');
var theControllerHelper = require('./ControllerHelper');

var CommentsController = function () {
    'use strict';

    this.getCommentsAboutRoute = function (pReq, pRes) {
        var routeId,
            callback;
        routeId = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theCommentsDao.getCommentsAboutRoute(routeId, callback);
    };

    this.createComment = function (pReq, pRes) {
        var userId,
            routeId,
            message,
            callback;
        userId = pReq.user.id;
        routeId = pReq.params.id;
        message = pReq.body.message;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theCommentsDao.createComment(userId, routeId, message, callback);
    };

    this.deleteComment = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theCommentsDao.deleteComment(id, callback);
    };
};

module.exports = new CommentsController();
