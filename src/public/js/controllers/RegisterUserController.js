/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterUserController', [
        '$scope',
        '$location',
        'UsersService',
        'GymsService',
        'LoginService',
        function (
            $scope,
            $location,
            UsersService,
            GymsService,
            LoginService
        ) {
            'use strict';

            $scope.form = {};

            GymsService.getGyms(function (pData) {
                $scope.form.gym = pData[0];
                $scope.gyms = pData;
            });

            $scope.registerClicked = function () {
                $scope.form.gym_id = $scope.form.gym.account_id;

                UsersService.registerUser($scope.form)
                    .success(function (pData) {
                        LoginService.setHeader(pData.token);
                        LoginService.setAccountType(pData.accountType);
                        LoginService.setAccountId(pData.accountId);
                        LoginService.setHomeGymId($scope.form.gym_id);
                        LoginService.setImageUrl(null);
                        LoginService.setName($scope.form.firstname + ' ' + $scope.form.lastname);
                        $scope.navigateToGym($scope.form.gym_id);
                    })
                    .error(function (pData) {
                        $scope.error = pData.error;

                        if ($scope.error === 'default error') {
                            $scope.error = 'Email address already in use';
                        }
                    });
            };
        }]);
