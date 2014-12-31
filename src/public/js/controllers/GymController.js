/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

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

            $scope.gymId = parseInt($routeParams.gymId, 10);

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

            GymsService.getHomeGymUsers($scope.gymId)
                .success(function (pData) {
                    $scope.users = pData;
                });

            GymsService.getGymImage($scope.gymId)
                .success(function (pData) {
                    $scope.image = pData;
                });

            GymsService.getActivityStream($scope.gymId)
                .success(function (pData) {
                    $scope.activity = pData;
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

            $scope.uploadImage = function () {
                angular.element("#image_file").trigger('click');
            };

            angular.element("#image_file").on('change', function () {
                angular.element("#image_submit").trigger('click');
                $scope.image = {
                    url: 'images/loading.gif'
                };
                $scope.$apply();
            });

            $scope.complete = function (content) {
                $scope.image = content;
            };

            $scope.authorization = LoginService.getHeader();
        }]);
