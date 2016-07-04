/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('GymLatestController', [
        '$scope',
        '$routeParams',
        '$rootScope',
        '$interval',
        '$timeout',
        'GymsService',
        'RoutesService',
        'BarGraphHelperService',
        'UsersService',
        'LoginService',
        'AlertsService',
        'GymUsersService',
        function (
            $scope,
            $routeParams,
            $rootScope,
            $interval,
            $timeout,
            GymsService,
            RoutesService,
            BarGraphHelperService,
            UsersService,
            LoginService,
            AlertsService,
            GymUsersService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $rootScope.hideTopNav = true;

            // GymsService.getNewestBoulder($scope.gymId)
            //     .success(function (pData) {
            //         $scope.newestBoulder = pData;
            //     });
            //
            // GymsService.getNewestTopRope($scope.gymId)
            //     .success(function (pData) {
            //         $scope.newestTopRope = pData;
            //     });
            //
            // GymsService.getNewestLead($scope.gymId)
            //     .success(function (pData) {
            //         $scope.newestLead = pData;
            //     });

        }]);
