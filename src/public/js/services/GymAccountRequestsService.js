/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('GymAccountRequestsService', ['$http', function ($http) {
        'use strict';

        return {
            createGymAccountRequest: function (pEmail, pName, pAddress) {
                return $http({
                    method: 'POST',
                    url: 'api/requests',
                    data: {
                        email: pEmail,
                        name: pName,
                        address: pAddress
                    }
                });
            }
        };
    }]);
