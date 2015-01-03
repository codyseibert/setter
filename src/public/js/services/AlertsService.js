/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
    .factory('AlertsService', ['$http', function ($http) {
        'use strict';

        return {
            getAlertsForGym: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/alerts'
                });
            },
            createAlert: function (pGymId, pMessage) {
                return $http({
                    method: 'POST',
                    url: 'api/gyms/' + pGymId + '/alerts',
                    data: {
                        message: pMessage
                    }
                });
            },
            deleteAlert: function (pAlertId) {
                return $http({
                    method: 'DELETE',
                    url: 'api/alerts/' + pAlertId
                });
            }
        };
    }]);
