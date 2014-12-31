/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterGymController', ['$scope', 'GymsService', 'LoginService', '$location', function ($scope, GymsService, LoginService, $location) {
        'use strict';

        $scope.form = {};

        $scope.registerClicked = function () {
            GymsService.registerGym($scope.form)
                .success(function (pData) {
                    LoginService.setHeader(pData.token);
                    LoginService.setAccountType(pData.accountType);
                    LoginService.setAccountId(pData.accountId);
                    $scope.navigateToGymDashboard(pData.accountId);
                })
                .error(function (pData) {
                    $scope.error = pData.error;
                });
        };
    }]);