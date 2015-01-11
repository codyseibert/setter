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

            $scope.changePassword = function () {

                if ($scope.form.password !== $scope.form.repeat) {
                    $scope.error = "Passwords did not match!";
                    $scope.form.password = "";
                    $scope.form.repeat = "";
                    return;
                }

                AccountsService.changePassword($scope.form.password)
                    .success(function (pData) {
                        $scope.form.password = "";
                        $scope.form.repeat = "";
                    });
            };
        }]);
