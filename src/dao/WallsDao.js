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

    this.getWallsInGym = function (pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT id, name FROM walls WHERE gym_id = ?',
            [pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createWall = function (pWallName, pGymId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO walls (name, gym_id) VALUES (?, ?)',
            [pWallName, pGymId],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.updateWall = function (pId, pName, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE walls SET name = ? WHERE id = ?',
            [pName, pId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.deleteWall = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM walls WHERE id = ?',
            [pId],
            theDaoHelper.DELETE,
            pCallback
        );
    };

};

module.exports = new WallsDao();
