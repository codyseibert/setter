/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LoginController', [
        '$scope',
        '$location',
        '$cookies',
        'LoginService',
        function (
            $scope,
            $location,
            $cookies,
            LoginService
        ) {
            'use strict';

            if (LoginService.isLoggedIn()) {
                LoginService.navigateToCorrectProfile();
                return;
            }

            $scope.form = {};
            $scope.form.email = $cookies.email || '';

            $scope.login = function () {

                LoginService.login($scope.form)
                    .success(function (pData) {
                        $cookies.email = $scope.form.email;

                        LoginService.setHeader(pData.token);
                        LoginService.setAccountType(pData.accountType);
                        LoginService.setAccountId(pData.accountId);
                        LoginService.setHomeGymId(pData.homeGymId);
                        LoginService.setImageUrl(pData.url);
                        LoginService.setName(pData.fullname);
                        LoginService.navigateToCorrectHomePage();
                    })
                    .error(function () {
                        $scope.error = 'Invalid Login!';
                    });
            };

            $scope.down = function (pEvent) {
                var code = pEvent.keyCode || pEvent.which;
                if (code === 13) {
                    $scope.login();
                }
            };
        }]);
