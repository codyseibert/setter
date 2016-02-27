/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SendsService', ['$http', function ($http) {
        'use strict';

        return {
            getSendsForRoute: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId + '/sends'
                });
            },
            hasSent: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId + '/hasSent'
                });
            },
            createSend: function (pRouteId) {
                return $http({
                    method: 'POST',
                    url: 'api/routes/' + pRouteId + '/sends'
                });
            },
            deleteSend: function (pRouteId) {
                return $http({
                    method: 'DELETE',
                    url: 'api/routes/' + pRouteId + '/sends'
                });
            }
        };
    }]);
