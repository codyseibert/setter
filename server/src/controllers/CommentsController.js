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
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theCommentsDao.getCommentsAboutRoute(routeId, callback);
    };

    this.createComment = function (pReq, pRes) {
        var userId,
            routeId,
            message,
            callback;
        userId = pReq.user.accountId;
        routeId = pReq.params.routeId;
        message = pReq.body.message;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theCommentsDao.createComment(userId, routeId, message, callback);
    };

    this.updateComment = function (pReq, pRes) {
        var commentId,
            userId,
            message,
            callback;
        commentId = pReq.params.commentId;
        userId = pReq.user.accountId;
        message = pReq.body.message;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theCommentsDao.updateComment(userId, commentId, message, callback);
    };

    this.deleteComment = function (pReq, pRes) {
        var userId,
            commentId,
            callback;
        userId = pReq.user.accountId;
        commentId = pReq.params.commentId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theCommentsDao.deleteComment(userId, commentId, callback);
    };
};

module.exports = new CommentsController();
