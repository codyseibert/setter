/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('WallsService', ['$http', function ($http) {
        'use strict';

        return {
            getWallsInGym: function (pGymId) {
                return $http({
                    method: "GET",
                    url: 'api/gyms/' + pGymId + '/walls'
                });
            },

            getWall: function (pGymId, pWallId) {
                return $http({
                    method: "GET",
                    url: 'api/gyms/' + pGymId + '/walls/' + pWallId
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
