/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterUserController', ['$scope', 'UsersService', 'LoginService', '$location', function ($scope, UsersService, LoginService, $location) {
        'use strict';

        $scope.form = {};

        $scope.registerClicked = function () {
            UsersService.registerUser($scope.form)
                .success(function (pData) {
                    LoginService.setHeader(pData);
                    $location.path('notes');
                })
                .error(function (pData) {
                    $scope.error = pData.error;
                });
        };
    }]);
