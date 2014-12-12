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

var CommentsDao = function () {
    'use strict';

    this.getCommentsAboutRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT c.id, c.route_id, u.firstname, u.lastname, c.date FROM comments c ' +
                'INNER JOIN users u ON u.id = c.user_id WHERE c.route_id = ? ORDER BY c.date DESC',
            [pRouteId],
            pCallback
        );
    };

    this.createComment = function (pUserId, pRouteId, pMessage, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO comments (user_id, route_id, message, date) VALUES (?, ?, ?, NOW())',
            [pUserId, pRouteId, pMessage],
            pCallback
        );
    };

    this.deleteComment = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM comments WHERE id = ?',
            [pId],
            pCallback
        );
    };
};

module.exports = new CommentsDao();
