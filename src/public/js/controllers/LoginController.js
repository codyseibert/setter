/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LoginController', ['$scope', 'LoginService', function ($scope, LoginService) {
        'use strict';

        $scope.form = {};

        $scope.login = function () {
            LoginService.login($scope.form)
                .success(function (pData, pStatus, pHeaders, pConfig) {
                    console.log(pData);
                });
        };
    }]);
