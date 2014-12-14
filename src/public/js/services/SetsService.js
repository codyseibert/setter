/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SetsService', ['$http', function ($http) {
        'use strict';

        return {
            getSetsOnWall: function (pWallId) {
                return $http({
                    method: 'GET',
                    url: 'api/walls/' + pWallId + '/sets'
                });
            },
            getSet: function (pSetId) {
                return $http({
                    method: 'GET',
                    url: 'api/sets/' + pSetId
                });
            },
            createSet: function (pWallId) {
                return $http({
                    method: 'POST',
                    url: 'api/walls/' + pWallId + '/sets'
                });
            }
        };
    }]);
