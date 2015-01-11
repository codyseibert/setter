/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('PasswordResetController', [
        '$scope',
        '$window',
        'AccountsService',
        function (
            $scope,
            $window,
            AccountsService
        ) {
            'use strict';

            $scope.back = function () {
                $window.history.back();
            };

            $scope.resetPassword = function () {
                var email = $scope.form.email;
                AccountsService.resetPassword(email)
                    .success(function (pData) {
                        $scope.success = true;
                        $scope.email = "";
                    });
            };
        }]);
