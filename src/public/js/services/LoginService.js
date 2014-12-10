/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('LoginService', ['$http', function ($http) {
        'use strict';

        return {
            login: function (pLoginInfo) {
                return $http({
                    method: "POST",
                    url: "api/login",
                    data: pLoginInfo
                });
            }
        };
    }]);
