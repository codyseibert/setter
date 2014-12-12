/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LoginController', ['$scope', 'LoginService', '$location', function ($scope, LoginService, $location) {
        'use strict';

        $scope.form = {};

        $scope.login = function () {
            LoginService.login($scope.form)
                .success(function (pData) {
                    console.log(pData);
                });
        };

        $scope.navigateToRegisterUser = function () {
            $location.path('register/user');
        };

        $scope.navigateToRegisterGym = function () {
            $location.path('register/gym');
        };
    }]);
