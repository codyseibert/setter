/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SettersService', ['$http', function ($http) {
        'use strict';
        return {
            getSettersAtGym: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/setters'
                });
            },
            getUsers: function () {
                return $http({
                    method: 'GET',
                    url: 'api/setters'
                });
            },
            createSetterGymAccess: function (pGymId, pSetterId) {
                return $http({
                    method: 'POST',
                    url: 'api/gyms/' + pGymId + '/setters/access',
                    data: {
                        setterId: pSetterId
                    }
                });
            },
            removeSetterGymAccess: function (pGymId, pSetterId) {
                return $http({
                    method: 'DELETE',
                    url: 'api/gyms/' + pGymId + '/setters/' + pSetterId + '/access'
                });
            }
        };
    }]);
