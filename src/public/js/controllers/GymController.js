/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false */

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
            LoginService
        ) {
            'use strict';

            var createBoulderRoutesBarGraph,
                createRopeRoutesBarGraph;

            $scope.gymId = parseInt($routeParams.gymId);

            Chart.defaults.global.colours[0].fillColor = "rgba(237, 109, 86, 1)";
            Chart.defaults.global.colours[0].strokeColor = "rgba(237, 109, 86, 0.5)";
            Chart.defaults.global.colours[0].pointColor = "rgba(237, 109, 86, 0.5)";

            $scope.chartOptions = {
                scaleFontColor: "#000",
                scaleFontSize: 20
            };

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

            $scope.setHomeGym = function () {
                var yes = confirm("Are you sure you want to make " + $scope.gym.name + " your new home gym?");
                if (!yes) {
                    return;
                }

                UsersService.setHomeGym($scope.gymId)
                    .success(function () {
                        $rootScope.homeGymId = $scope.gymId;
                        LoginService.setHomeGymId($scope.gymId);
                        alert($scope.gym.name + " now set as your home gym!");
                    });
            };
        }]);
