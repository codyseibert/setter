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
            getGym: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId
                });
            }
        };
    }]);
