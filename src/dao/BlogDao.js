/*jslint nomen: true */

/*
Copyright (c) Cody Seibert and Guillermo Martinez

Do not copy, redistribute, sell, modify, etc, without
written legally bound permission from both Cody Seibert and
Guillermo Martinez.
*/

var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('./DaoHelper');

var BlogDao = function () {
    'use strict';

    this.getPosts = function (pCallback) {
        theDaoHelper.executeQuery(
            "SELECT id, html FROM blogs ORDER BY date DESC",
            [],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.updatePost = function (pBlogId, pHtml, pCallback) {
        theDaoHelper.executeQuery(
            "UPDATE blogs SET html = ? WHERE id = ?",
            [pHtml, pBlogId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.createPost = function (pHtml, pCallback) {
        theDaoHelper.executeQuery(
            "INSERT INTO blogs (html, date) VALUES (?, NOW())",
            [pHtml],
            theDaoHelper.INSERT,
            pCallback
        );
    };
};

module.exports = new BlogDao();
