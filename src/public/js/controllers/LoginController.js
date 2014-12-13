/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LoginController', ['$scope', 'LoginService', '$location', function ($scope, LoginService, $location) {
        'use strict';

        if (LoginService.isLoggedIn()) {
            LoginService.navigateToCorrectDashboard();
            return;
        }

        $scope.form = {};

        $scope.login = function () {
            LoginService.login($scope.form)
                .success(function (pData) {
                    LoginService.setHeader(pData.token);
                    LoginService.setAccountType(pData.typeId);
                    LoginService.navigateToCorrectDashboard();
                });
        };

        $scope.navigateToRegisterUser = function () {
            $location.path('user/register');
        };

        $scope.navigateToRegisterGym = function () {
            $location.path('gym/register');
        };
    }]);
