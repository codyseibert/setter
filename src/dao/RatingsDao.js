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

    this.updateRating = function (pUserId, pRouteId, pValue, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO ratings (user_id, route_id, value) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE value = ?',
            [pUserId, pRouteId, pValue, pValue],
            pCallback
        );
    };
};

module.exports = new RatingsDao();
