/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('GymDashboardController', [
        '$scope',
        'LoginService',
        'GymsService',
        'BarGraphHelperService',
        function (
            $scope,
            LoginService,
            GymsService,
            BarGraphHelperService
        ) {
            'use strict';
            var createBoulderRoutesBarGraph,
                createRopeRoutesBarGraph;

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.gymId = LoginService.getAccountId();

            createBoulderRoutesBarGraph = function (pData) {
                var data;
                data = BarGraphHelperService.generateRouteCountGraphData(pData);
                $scope.boulderRoutesBarGraph = {
                    labels: data.labels,
                    data: data.data
                };
            };

            createRopeRoutesBarGraph = function (pData) {
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
        }]);
