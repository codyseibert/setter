/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SettersService', ['$http', function ($http) {
        'use strict';
        return {
            getSettersAtGym: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gym/' + pGymId + '/setters'
                });
            },
            getUsers: function () {
                return $http({
                    method: 'GET',
                    url: 'api/setters'
                });
            },
            createSetterGymAccess: function (pSetterId) {
                return $http({
                    method: 'POST',
                    url: 'api/setters/access',
                    data: {
                        setterId: pSetterId
                    }
                });
            },
            removeSetterGymAccess: function (pSetterId) {
                return $http({
                    method: 'DELETE',
                    url: 'api/setters/' + pSetterId + '/access'
                });
            }
        };
    }]);
