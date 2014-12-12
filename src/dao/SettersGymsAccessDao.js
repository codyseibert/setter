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

    this.getAccessList = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT setter_id, gym_id FROM setters_gyms_access WHERE gym_id = ?',
            [pGymId],
            pCallback
        );
    };

    this.createAccess = function (pSetterId, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO setters_gyms_access (setter_id, gym_id) VALUES (?, ?)',
            [pSetterId, pGymId],
            pCallback
        );
    };

    this.deleteAccess = function (pSetterId, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM setters_gyms_access WHERE gym_id = ? AND setter_id = ?',
            [pGymId, pSetterId],
            pCallback
        );
    };
};

module.exports = new CommentsDao();
