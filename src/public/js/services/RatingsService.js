/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('RatingsService', ['$http', function ($http) {
        'use strict';
        return {
            getRatingForRoute: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId + '/rating'
                });
            },
            updateRating: function (pRouteId, pRating) {
                return $http({
                    method: 'POST',
                    url: 'api/routes/' + pRouteId + '/rating',
                    data: {
                        rating: pRating
                    }
                });
            },
            hasRated: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId + '/hasRated'
                });
            }
        };
    }]);
