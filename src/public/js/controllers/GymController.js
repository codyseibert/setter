/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('GymController', [
        '$scope',
        'GymsService',
        '$routeParams',
        'BarGraphHelperService',
        '$rootScope',
        'UsersService',
        'LoginService',
        function (
            $scope,
            GymsService,
            $routeParams,
            BarGraphHelperService,
            $rootScope,
            UsersService,
            LoginService) {
            'use strict';

        $scope.gymId = $routeParams.gymId;

        var createBoulderRoutesBarGraph = function (pData) {
            var data;
            data = BarGraphHelperService.generateRouteCountGraphData(pData);
            $scope.boulderRoutesBarGraph = {
                labels: data.labels,
                data: data.data
            };
        };

        var createRopeRoutesBarGraph = function (pData) {
            var data;
            data = BarGraphHelperService.generateRouteCountGraphData(pData);
            $scope.ropeRoutesBarGraph = {
                labels: data.labels,
                data: data.data
            };
        };

        GymsService.getGym($scope.gymId)
            .success(function (pData) {
                $scope.gym = pData;
            });

        GymsService.getCurrentBoulderRoutes($scope.gymId)
            .success(function (pData) {
                createBoulderRoutesBarGraph(pData);
            });

        GymsService.getCurrentRopeRoutes($scope.gymId)
            .success(function (pData) {
                createRopeRoutesBarGraph(pData);
            });

        $scope.setHomeGym = function () {
            UsersService.setHomeGym($scope.gymId)
                .success(function (pData) {
                    $rootScope.homeGymId = $scope.gymId;
                    LoginService.setHomeGymId($scope.gymId);
                });
        };
    }]);
