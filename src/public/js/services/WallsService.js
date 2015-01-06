/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('WallsService', ['$http', function ($http) {
        'use strict';

        var walls = {};
        var wall = {};

        return {
            getWallsInGym: function (pGymId, pCallback) {
                if (walls[pGymId]) {
                    pCallback(walls[pGymId]);
                    return;
                }

                $http({
                    method: "GET",
                    url: 'api/gyms/' + pGymId + '/walls'
                }).success(function (pData) {
                    walls[pGymId] = pData;
                    pCallback(walls[pGymId]);
                });
            },

            getWall: function (pGymId, pWallId, pCallback) {
                if (wall[pWallId]) {
                    pCallback(wall[pWallId]);
                    return;
                }

                $http({
                    method: "GET",
                    url: 'api/gyms/' + pGymId + '/walls/' + pWallId
                }).success(function (pData) {
                    wall[pWallId] = pData;
                    pCallback(wall[pWallId]);
                });
            },

            createWall: function (pGymId, pWallName) {
                return $http({
                    method: "POST",
                    url: 'api/gyms/' + pGymId + '/walls',
                    data: {
                        wallName: pWallName
                    }
                });
            },

            updateWall: function (pGymId, pWallId, pWallName) {
                return $http({
                    method: "POST",
                    url: 'api/gyms/' + pGymId + '/walls/' + pWallId,
                    data: {
                        wallName: pWallName
                    }
                });
            },

            deleteWall: function (pGymId, pWallId) {
                return $http({
                    method: "DELETE",
                    url: 'api/gyms/' + pGymId + '/walls/' + pWallId
                });
            }
        };
    }]);
