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
SetsDao

Contains logic related to Sets.
*/
var SetsDao = function () {
    'use strict';

    this.getSets = function (pWallId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id FROM sets WHERE wall_id = ?',
            [pWallId],
            pCallback
        );
    };

    this.createSet = function (pWallId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO sets (date, wall_id) VALUES (NOW(), ?)',
            [pWallId],
            pCallback
        );
    };

    this.deleteSet = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM sets WHERE id = ?',
            [pId],
            pCallback
        );
    };
};

module.exports = new SetsDao();
