/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('GymController', [
        '$scope',
        '$routeParams',
        '$rootScope',
        'GymsService',
        'RoutesService',
        'BarGraphHelperService',
        'UsersService',
        'LoginService',
        'AlertsService',
        'GradesService',
        'DateFormatService',
        function (
            $scope,
            $routeParams,
            $rootScope,
            GymsService,
            RoutesService,
            BarGraphHelperService,
            UsersService,
            LoginService,
            AlertsService,
            GradesService,
            DateFormatService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            var createBoulderRoutesBarGraph,
                createRopeRoutesBarGraph;

            $scope.gymId = parseInt($routeParams.gymId, 10);

            $scope.chartOptions = {
                scaleFontColor: "#000",
                scaleFontSize: 20,
                animation: false
            };

            createBoulderRoutesBarGraph = function (pData) {
                var data = BarGraphHelperService
                    .generateRouteCountGraphData(pData);
                $scope.boulderRoutesBarGraph = data;
            };

            createRopeRoutesBarGraph = function (pData) {
                var data = BarGraphHelperService
                    .generateRouteCountGraphData(pData);
                $scope.ropeRoutesBarGraph = data;
            };

            GymsService.getGym($scope.gymId, function (pData) {
                $scope.gym = pData;
            });

            RoutesService.getCurrentBoulderRoutes($scope.gymId, function (pData) {
                createBoulderRoutesBarGraph(pData);
            });

            RoutesService.getCurrentRopeRoutes($scope.gymId, function (pData) {
                createRopeRoutesBarGraph(pData);
            });

            GymsService.getHomeGymUsers($scope.gymId, function (pData) {
                $scope.users = pData;
            });

            GymsService.getGymImage($scope.gymId, function (pData) {
                $scope.image = pData;
            });

            GymsService.getNumberOfNewRoutes($scope.gymId)
                .success(function (pData) {
                    $scope.newRoutes = pData;
                });

            GymsService.getActivityStream($scope.gymId)
                .success(function (pData) {
                    $scope.activity = pData;
                });

            AlertsService.getAlertsForGym($scope.gymId)
                .success(function (pData) {
                    pData.map(function (pEntry) {
                        pEntry.date = DateFormatService.format(pEntry.date);
                        return pEntry;
                    });
                    $scope.alerts = pData;
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

            $scope.showCharts = function () {
                angular.element('#charts').css('left', '0px');
                angular.element('#charts').css('position', 'relative');
            };

            $scope.hideCharts = function () {
                angular.element('#charts').css('left', '9999px');
                angular.element('#charts').css('position', 'absolute');
            };

            $scope.hideCharts();
        }]);
