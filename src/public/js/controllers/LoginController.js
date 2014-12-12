/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LoginController', ['$scope', 'LoginService', '$location', function ($scope, LoginService, $location) {
        'use strict';

        var USER_TYPE = 1,
            GYM_TYPE = 2;

        $scope.form = {};

        $scope.login = function () {
            LoginService.login($scope.form)
                .success(function (pData) {
                    LoginService.setHeader(pData.token);
                    if (pData.type_id === USER_TYPE) {
                        $scope.navigateToUserDashboard();
                    } else if (pData.type_id === GYM_TYPE) {
                        $scope.navigateToGymDashboard();
                    }
                });
        };

        $scope.navigateToRegisterUser = function () {
            $location.path('user/register');
        };

        $scope.navigateToRegisterGym = function () {
            $location.path('gym/register');
        };
    }]);
