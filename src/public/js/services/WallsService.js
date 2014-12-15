/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('WallsService', ['$http', function ($http) {
        'use strict';

        return {
            getWallsInGym: function (pGymId) {
                return $http({
                    method: "GET",
                    url: 'api/gym/' + pGymId + '/walls'
                });
            },

            getWall: function (pWallId) {
                return $http({
                    method: "GET",
                    url: 'api/walls/' + pWallId
                });
            },

            createWall: function (pWallName) {
                return $http({
                    method: "POST",
                    url: 'api/walls',
                    data: {
                        wallName: pWallName
                    }
                });
            },

            updateWall: function (pWallId, pWallName) {
                return $http({
                    method: "POST",
                    url: 'api/walls/' + pWallId,
                    data: {
                        wallName: pWallName
                    }
                });
            },

            deleteWall: function (pWallId) {
                return $http({
                    method: "DELETE",
                    url: 'api/walls/' + pWallId
                });
            }
        };
    }]);
