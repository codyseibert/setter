/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('LoginService', ['$http', '$cookies', '$location', '$rootScope', function ($http, $cookies, $location, $rootScope) {
        'use strict';

        var USER_TYPE = 1,
            GYM_TYPE = 2,
            accountType = USER_TYPE,
            accountId = null;

        return {
            login: function (pLoginInfo) {
                return $http({
                    method: "POST",
                    url: "api/login",
                    data: pLoginInfo
                });
            },
            setHeader: function (pToken) {
                $http.defaults.headers.common.Authorization = 'Bearer ' + pToken;
                $cookies.token = pToken;
            },
            validateLoggedIn: function () {
                if (!this.isLoggedIn()) {
                    $location.path('login');
                    return false;
                }
                return true;
            },
            isLoggedIn: function () {
                return $http.defaults.headers.common.Authorization !== undefined;
            },
            setHeaderFromCookie: function () {
                $http.defaults.headers.common.Authorization = 'Bearer ' + $cookies.token;
            },
            setTypeFromCookie: function () {
                accountType = parseInt($cookies.accountType, 10);
            },
            setAccountIdFromCookie: function () {
                accountId = parseInt($cookies.accountId, 10);
            },
            hasTokenInCookie: function () {
                return $cookies.token !== undefined;
            },
            logout: function () {
                delete $cookies.token;
                delete $cookies.accountType;
                delete $cookies.accountId;
                delete $http.defaults.headers.common.Authorization;
            },
            setAccountType: function (pAccountType) {
                pAccountType = parseInt(pAccountType, 10);
                accountType = pAccountType;
                $cookies.accountType = pAccountType;
            },
            setAccountId: function (pAccountId) {
                pAccountId = parseInt(pAccountId, 10);
                accountId = pAccountId;
                $cookies.accountId = pAccountId;
            },
            getAccountType: function () {
                return accountType;
            },
            getAccountId: function () {
                return accountId;
            },
            isGymAccount: function () {
                return accountType === GYM_TYPE;
            },
            isUserAccount: function () {
                return accountType === USER_TYPE;
            },
            navigateToCorrectDashboard: function () {
                if (accountType === USER_TYPE) {
                    $rootScope.navigateToUserDashboard(accountId);
                } else if (accountType === GYM_TYPE) {
                    $rootScope.navigateToGymDashboard(accountId);
                }
            }
        };

    }]);
