/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('UsersService', ['$http', function ($http) {
        'use strict';

        return {
            registerUser: function (pRegistrationInfo) {
                return $http({
                    method: "POST",
                    url: "api/register/user",
                    data: pRegistrationInfo
                });
            }
        };
    }]);
