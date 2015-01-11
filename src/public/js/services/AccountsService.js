/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('AccountsService', ['$http', function ($http) {
        'use strict';

        return {
            login: function () {
                return $http({
                    method: "POST",
                    url: "api/accounts/login"
                });
            },

            resetPassword: function (pEmail) {
                return $http({
                    method: "POST",
                    url: "api/password/reset",
                    data: {email: pEmail}
                });
            },

            changePassword: function (pPassword) {
                return $http({
                    method: "POST",
                    url: "api/password/change",
                    data: {password: pPassword}
                });
            }
        };
    }]);
