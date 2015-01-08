/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('LoginService', [
        '$http',
        '$cookies',
        '$location',
        '$rootScope',
        'GymsService',
        'RoutesService',
        'WallsService',
        function (
            $http,
            $cookies,
            $location,
            $rootScope,
            GymsService,
            RoutesService,
            WallsService
        ) {
            'use strict';

            var USER_TYPE = 1,
                GYM_TYPE = 2,
                accountType = USER_TYPE,
                homeGymId = null,
                accountId = null,
                url = null,
                name = null;

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
                setImageUrlFromCookie: function () {
                    url = $cookies.url;
                },
                setHomeGymIdFromCookie: function () {
                    homeGymId = $cookies.homeGymId;

                    if ($cookies.homeGymId) {
                        homeGymId = parseInt($cookies.homeGymId, 10);
                    }
                },
                setNameFromCookie: function () {
                    name = $cookies.name;
                },
                hasTokenInCookie: function () {
                    return $cookies.token !== undefined;
                },
                logout: function () {
                    delete $cookies.token;
                    delete $cookies.accountType;
                    delete $cookies.accountId;
                    delete $cookies.homeGymId;
                    delete $cookies.url;
                    delete $cookies.name;
                    delete $http.defaults.headers.common.Authorization;

                    WallsService.clearCache();
                    GymsService.clearCache();
                    RoutesService.clearCache();

                    $location.path("login");
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
                setHomeGymId: function (pHomeGymId) {
                    if (pHomeGymId) {
                        pHomeGymId = parseInt(pHomeGymId, 10);
                    }
                    homeGymId = pHomeGymId;
                    $cookies.homeGymId = pHomeGymId;
                },
                setImageUrl: function (pUrl) {
                    url = pUrl;
                    $cookies.url = url;
                },
                setName: function (pName) {
                    name = pName;
                    $cookies.name = pName;
                },
                getHomeGymId: function () {
                    return homeGymId;
                },
                getAccountType: function () {
                    return accountType;
                },
                getAccountId: function () {
                    return accountId;
                },
                getImageUrl: function () {
                    return url;
                },
                getName: function () {
                    return name;
                },
                isGymAccount: function () {
                    return accountType === GYM_TYPE;
                },
                isUserAccount: function () {
                    return accountType === USER_TYPE;
                },
                getHeader: function () {
                    return $http.defaults.headers.common.Authorization;
                },
                navigateToCorrectProfile: function () {
                    if (accountType === USER_TYPE) {
                        $rootScope.navigateToUser(accountId);
                    } else if (accountType === GYM_TYPE) {
                        $rootScope.navigateToGym(accountId);
                    }
                }
            };

        }]);
