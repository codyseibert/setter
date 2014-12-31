/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('GymsService', ['$http', function ($http) {
        'use strict';

        return {
            registerGym: function (pRegistrationInfo) {
                return $http({
                    method: 'POST',
                    url: 'api/register/gym',
                    data: pRegistrationInfo
                });
            },
            getGyms: function () {
                return $http({
                    method: 'GET',
                    url: 'api/gyms'
                });
            },
            getGymImage: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/image'
                });
            },
            getGym: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId
                });
            },
            getHomeGymUsers: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/users'
                });
            },
            getCurrentBoulderRoutes: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/routes/boulder'
                });
            },
            getCurrentRopeRoutes: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/routes/rope'
                });
            }
        };
    }]);
