/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('WallsService', [
        '$http',
        '$q',
        function (
            $http,
            $q
        ) {
            'use strict';

            var walls = {},
                wall = {};

            return {
                clearCache: function () {
                    walls = {};
                    wall = {};
                },

                // Forces the browser to refresh data on the /walls
                setWallsDirty: function (pGymId) {
                    delete walls[pGymId];
                },

                // Used for forcing the service to refresh data on /wall
                setWallDirty: function (pWallId) {
                    delete wall[pWallId];
                },

                getWallsInGym: function (pGymId, pCallback) {
                    var deferred = $q.defer();

                    if (walls[pGymId]) {
                        pCallback(walls[pGymId]);
                        deferred.resolve();
                        return deferred;
                    }

                    $http({
                        method: "GET",
                        url: 'api/gyms/' + pGymId + '/walls'
                    }).success(function (pData) {
                        walls[pGymId] = pData;
                        pCallback(walls[pGymId]);
                        deferred.resolve();
                    });

                    return deferred;
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

                createWall: function (pGymId, pWallName, pZoneType) {
                    this.setWallsDirty(pGymId);

                    return $http({
                        method: "POST",
                        url: 'api/gyms/' + pGymId + '/walls',
                        data: {
                            wallName: pWallName,
                            zoneType: pZoneType
                        }
                    });
                },

                updateWall: function (pGymId, pWallId, pWallName) {
                    this.setWallDirty(pWallId);
                    this.setWallsDirty(pGymId);

                    return $http({
                        method: "POST",
                        url: 'api/gyms/' + pGymId + '/walls/' + pWallId,
                        data: {
                            wallName: pWallName
                        }
                    });
                },

                deleteWall: function (pGymId, pWallId) {
                    this.setWallsDirty(pGymId);

                    return $http({
                        method: "DELETE",
                        url: 'api/gyms/' + pGymId + '/walls/' + pWallId
                    });
                },

                stripZone: function (pGymId, pWallId) {
                    this.setWallDirty(pWallId);
                    this.setWallsDirty(pGymId);

                    return $http({
                        method: "POST",
                        url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/strip'
                    });
                },

                stripColor: function (pGymId, pWallId, colorId) {
                    this.setWallDirty(pWallId);
                    this.setWallsDirty(pGymId);

                    return $http({
                        method: "POST",
                        url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/strip/color/' + colorId
                    });
                }
            };
        }]);
