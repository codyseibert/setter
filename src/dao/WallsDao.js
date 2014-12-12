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
WallsDao

Contains logic related to Walls.
*/
var WallsDao = function () {
    'use strict';

    this.getWalls = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id FROM walls WHERE gym_id = ?',
            [pGymId],
            pCallback
        );
    };

    this.createWall = function (pName, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO walls (name, gym_id) VALUES (?, ?)',
            [pName, pGymId],
            pCallback
        );
    };

    this.updateWall = function (pId, pName, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE walls SET name = ? WHERE id = ?',
            [pName, pId],
            pCallback
        );
    };

    this.deleteWall = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM walls WHERE id = ?',
            [pId],
            pCallback
        );
    };
};

module.exports = new WallsDao();
