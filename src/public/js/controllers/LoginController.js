/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LoginController', [
        '$scope',
        '$location',
        'LoginService',
        function (
            $scope,
            $location,
            LoginService
        ) {
        'use strict';

        if (LoginService.isLoggedIn()) {
            LoginService.navigateToCorrectProfile();
            return;
        }

        $scope.form = {};

        $scope.login = function () {
            LoginService.login($scope.form)
                .success(function (pData) {
                    LoginService.setHeader(pData.token);
                    LoginService.setAccountType(pData.accountType);
                    LoginService.setAccountId(pData.accountId);
                    LoginService.setHomeGymId(pData.homeGymId);
                    LoginService.setImageUrl(pData.url);
                    LoginService.setName(pData.fullname);
                    LoginService.navigateToCorrectProfile();
                })
                .error(function () {
                    $scope.error = 'Invalid Login!';
                });
        };
    }]);
