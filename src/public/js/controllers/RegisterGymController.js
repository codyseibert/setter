/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterGymController', [
        '$scope',
        '$location',
        'GymAccountRequestsService',
        'LoginService',
        function (
            $scope,
            $location,
            GymAccountRequestsService,
            LoginService
        ) {
        'use strict';

        $scope.form = {};

        $scope.save = function () {
            GymAccountRequestsService.createGymAccountRequest(
                $scope.form.email, $scope.form.name, $scope.form.address)
                .success(function (pData) {
                });
        };
    }]);
