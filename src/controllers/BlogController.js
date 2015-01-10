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

var theBlogDao = require('../dao/BlogDao');
var theControllerHelper = require('./ControllerHelper');

var BlogController = function () {
    'use strict';

    this.getPosts = function (pReq, pRes) {
        var callback;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theBlogDao.getPosts(callback);
    };

    this.createPost = function (pReq, pRes) {
        var html,
            callback;

        if (pReq.user.accountId !== 1) {
            pRes.status = 400;
            pRes.send({error: 'invalid permissions'});
            return;
        }

        html = pReq.body.html;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theBlogDao.createPost(html, callback);
    };

    this.updatePost = function (pReq, pRes) {
        var id,
            html,
            callback;

        if (pReq.user.accountId !== 1) {
            pRes.status = 400;
            pRes.send({error: 'invalid permissions'});
            return;
        }

        html = pReq.body.html;
        id = pReq.params.blogId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theBlogDao.updatePost(id, html, callback);
    };
};

module.exports = new BlogController();
