/*jslint nomen: true */

/*
Copyright (c) Cody Seibert and Guillermo Martinez

Do not copy, redistribute, sell, modify, etc, without
written legally bound permission from both Cody Seibert and
Guillermo Martinez.
*/

var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theGymsDao = require('../dao/GymsDao');
var theDaoHelper = require('./DaoHelper');

var RouteNewToUserDao = function () {
    'use strict';

    /**
    *   When a gym sets a new route
    */
    this.createNewRouteToUserAlertsForGym = function (pGymId, pWallId, pRouteId, pCallback) {

        var createNewRouteToUserAlerts = function (pHomeGymUsers) {
            var values = [],
                user,
                i;

            for (i = 0; i < pHomeGymUsers.length; i += 1) {
                user = pHomeGymUsers[i];
                values.push([pGymId, pWallId, pRouteId, user.id]);
            }

            theDaoHelper.executeQuery(
                'INSERT INTO route_new_to_user (gym_id, wall_id, route_id, user_id) VALUES ?',
                [values],
                theDaoHelper.INSERT,
                pCallback
            );
        };

        theGymsDao.getHomeGymUsers(pGymId, createNewRouteToUserAlerts);
    }

    /**
    *   When a user actually views the route on the route.tpl
    */
    this.deleteNewRouteToUserAlert = function (pRouteId, pAccountId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM route_new_to_user WHERE route_id = ? AND user_id = ?',
            [pRouteId, pAccountId],
            theDaoHelper.DELETE,
            pCallback
        );
    }
};

module.exports = new RouteNewToUserDao();
