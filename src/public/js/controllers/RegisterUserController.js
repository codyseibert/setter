/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterUserController', ['$scope', 'UsersService', function ($scope, UsersService) {
        'use strict';

        $scope.form = {};

        $scope.registerClicked = function () {
            UsersService.registerUser($scope.form)
                .success(function (pData, pStatus, pHeaders, pConfig) {
                    console.log('user registered', pData);
                });
        };
    }]);
