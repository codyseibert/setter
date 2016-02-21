/*jslint nomen: true */

/*
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
*/

var theRouteNewToUserDao = require('../dao/RouteNewToUserDao');
var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('./DaoHelper');

/**
    WallsDao

    Contains logic related to Walls.
*/
var WallsDao = function () {
    'use strict';

    this.getWallsInGym = function (pGymId, pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT w.id, w.name, w.last_update, i.url, ' +
                '(SELECT COUNT(*) FROM route_new_to_user rntu WHERE rntu.wall_id = w.id AND rntu.user_id = ?) AS new_count, ' +
                '(SELECT COUNT(*) FROM routes r WHERE r.wall_id = w.id AND r.active = 1) AS route_count ' +
                'FROM walls w ' +
                'LEFT JOIN images i ON i.id = w.image_id ' +
                'WHERE w.gym_id = ?',
            [pAccountId, pGymId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.getWall = function (pWallId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT w.id, w.name, i.url FROM walls w ' +
                'LEFT JOIN images i ON i.id = w.image_id WHERE w.id = ?',
            [pWallId],
            theDaoHelper.SINGLE,
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

    this.updateWall = function (pAccountId, pWallId, pName, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE walls SET name = ? WHERE id = ? AND gym_id = ?',
            [pName, pWallId, pAccountId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.updateImage = function (pImageId, pWallId, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE walls SET image_id = ? WHERE id = ?',
            [pImageId, pWallId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.updateLastUpdate = function (pWallId, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE walls SET last_update = NOW() WHERE id = ?',
            [pWallId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.deleteWall = function (pAccountId, pWallId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM walls WHERE id = ? AND gym_id = ?',
            [pWallId, pAccountId],
            theDaoHelper.DELETE,
            pCallback
        );
    };

    this.stripZone = function (pZoneId, pCallback) {

        var deleteAlerts = function (pResults) {
            theRouteNewToUserDao
                .deleteAllNewRouteToUserAlertForZone(pZoneId, function () {
                    pCallback(pResults);
                });
        };

        theDaoHelper.executeQuery(
            'UPDATE routes SET active = 0 WHERE wall_id = ? AND active = 1',
            [pZoneId],
            theDaoHelper.UPDATE,
            deleteAlerts
        );
    };

    this.stripColor = function (pZoneId, pColorId, pCallback) {

        var deleteAlerts = function (pResults) {
            theRouteNewToUserDao
                .deleteAllNewRouteToUserAlertForZoneColor(pZoneId, pColorId, function () {
                    pCallback(pResults);
                });
        };

        theDaoHelper.executeQuery(
            'UPDATE routes SET active = 0 WHERE wall_id = ? AND color_id = ? AND active = 1',
            [pZoneId, pColorId],
            theDaoHelper.UPDATE,
            deleteAlerts
        );
    };
};

module.exports = new WallsDao();
