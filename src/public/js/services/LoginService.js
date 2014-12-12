/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('LoginService', ['$http', '$cookies', '$location', function ($http, $cookies, $location) {
        'use strict';

        return {
            login: function (pLoginInfo) {
                return $http({
                    method: "POST",
                    url: "api/login",
                    data: pLoginInfo
                });
            },
            setHeader: function (pToken) {
                $cookies.token = pToken;
                $http.defaults.headers.common.Authorization = 'Bearer ' + pToken;
            },
            validateLoggedIn: function () {
                if (!$http.defaults.headers.common.Authorization) {
                    $location.path('login');
                    return false;
                }
                return true;
            },
            isLoggedIn: function () {
                return $http.defaults.headers.common.Authorization !== undefined;
            }
        };

    }]);
