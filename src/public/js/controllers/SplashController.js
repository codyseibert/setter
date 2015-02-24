/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false, alert: false */

angular.module('SETTER')
    .controller('SplashController', [
        '$scope',
        'UsersService',
        'GymsService',
        'LoginService',
        'GymAccountRequestsService',
        function (
            $scope,
            UsersService,
            GymsService,
            LoginService,
            GymAccountRequestsService
        ) {
            'use strict';

            if (LoginService.isLoggedIn()) {
                LoginService.logout();
            }

            $scope.form = {};
            $scope.requestForm = {};

            $scope.GYM_REGISTRATION = 'gymRegistration';
            $scope.USER_REGISTRATION = 'userRegistration';
            $scope.currentRegistrationTab = $scope.GYM_REGISTRATION;

            $scope.panel = $scope.GYM_REGISTRATION;

            GymsService.getGyms(function (pData) {
                $scope.form.gym = pData[0];
                $scope.gyms = pData;
            });

            $scope.setCurrentTab = function (pCurrentTab) {
                $scope.currentRegistrationTab = pCurrentTab;
            };

            $scope.saveAccountRequest = function () {
                GymAccountRequestsService.createGymAccountRequest($scope.requestForm.email, $scope.requestForm.name, $scope.requestForm.address)
                    .success(function () {
                        $scope.requestForm.email = "";
                        $scope.requestForm.name = "";
                        $scope.requestForm.address = "";
                        alert("Thank you for requesting an account!  We will get back to you soon with your account information!");
                        return undefined;
                    });
            };

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
