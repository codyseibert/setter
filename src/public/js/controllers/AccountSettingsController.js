/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('AccountSettingsController', [
        '$scope',
        'AccountsService',
        function (
            $scope,
            AccountsService
        ) {
            'use strict';
            $scope.settings = {
              hide_setters: true
            };

            AccountsService.getSettings()
              .success(function (pData) {
                  $scope.settings.hide_setters = pData.hide_setters === 1;
              });

            $scope.updateSettings = function () {
              AccountsService.updateSettings($scope.settings)
                .success(function (pData) {
                });
            };

            $scope.changePassword = function () {

                if ($scope.form.password !== $scope.form.repeat) {
                    $scope.error = "Passwords did not match!";
                    $scope.form.password = "";
                    $scope.form.repeat = "";
                    return;
                }

                AccountsService.changePassword($scope.form.password)
                    .success(function () {
                        $scope.form.password = "";
                        $scope.form.repeat = "";
                    });
            };

        }]);
