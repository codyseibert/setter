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

/**
    RoutesDao

    Contains logic related to Routes.
*/
var RatingsDao = function () {
    'use strict';

    this.getRatingForRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT AVG(rating) AS rating FROM ratings WHERE route_id = ?',
            [pRouteId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.updateRating = function (pUserId, pRouteId, pRating, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO ratings (user_id, route_id, rating) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE rating = ?',
            [pUserId, pRouteId, pRating, pRating],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.hasRated = function (pUserId, pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT rating FROM ratings WHERE user_id = ? AND route_id = ?',
            [pUserId, pRouteId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };
};

module.exports = new RatingsDao();
