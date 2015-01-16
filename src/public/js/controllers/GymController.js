/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('GymController', [
        '$scope',
        '$routeParams',
        '$rootScope',
        '$window',
        '$compile',
        'GymsService',
        'RoutesService',
        'BarGraphHelperService',
        'UsersService',
        'LoginService',
        'AlertsService',
        'DateFormatService',
        function (
            $scope,
            $routeParams,
            $rootScope,
            $window,
            $compile,
            GymsService,
            RoutesService,
            BarGraphHelperService,
            UsersService,
            LoginService,
            AlertsService,
            DateFormatService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            var createBoulderRoutesBarGraph,
                createTopRopeRoutesBarGraph,
                createLeadRoutesBarGraph;

            $scope.gymId = parseInt($routeParams.gymId, 10);

            $scope.chartOptions = {
                scaleFontColor: "#000",
                scaleFontSize: 20,
                animation: false
            };

            $scope.PANEL_ACTIVITY = 'ACTIVITY',
            $scope.PANEL_STATS = 'STATS',
            $scope.PANEL_CLIMBERS = 'CLIMBERS'
            $scope.panel = $scope.PANEL_ACTIVITY;

            /*
            *   SECTION - Gym related service calls
            */
            GymsService.getGym($scope.gymId, function (pData) {
                $scope.gym = pData;
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




            /*
            *   SECTION - Alerts
            */
            AlertsService.getAlertsForGym($scope.gymId)
            .success(function (pData) {
                pData.map(function (pEntry) {
                    pEntry.date = DateFormatService.format(pEntry.date);
                    return pEntry;
                });
                $scope.alerts = pData;
            });




            /*
            *   SECTION - Distribution Graphs
            */
            createBoulderRoutesBarGraph = function (pData) {
                var data = BarGraphHelperService
                    .generateRouteCountGraphData(pData);
                $scope.boulderRoutesBarGraph = data;
            };

            createTopRopeRoutesBarGraph = function (pData) {
                var data = BarGraphHelperService
                    .generateRouteCountGraphData(pData);
                $scope.topRopeRoutesBarGraph = data;
            };

            createLeadRoutesBarGraph = function (pData) {
                var data = BarGraphHelperService
                    .generateRouteCountGraphData(pData);
                $scope.leadRoutesBarGraph = data;
            };




            /*
            *   SECTION - Newest Routes
            */
            GymsService.getNewestBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.newestBoulder = pData;
                });

            GymsService.getNewestTopRope($scope.gymId)
                .success(function (pData) {
                    $scope.newestTopRope = pData;
                });

            GymsService.getNewestLead($scope.gymId)
                .success(function (pData) {
                    $scope.newestLead = pData;
                });




            /*
            *   SECTION - Current Routes
            */
            RoutesService.getCurrentBoulderRoutes($scope.gymId, function (pData) {
                createBoulderRoutesBarGraph(pData);
            });

            RoutesService.getCurrentTopRopeRoutes($scope.gymId, function (pData) {
                createTopRopeRoutesBarGraph(pData);
            });

            RoutesService.getCurrentLeadRoutes($scope.gymId, function (pData) {
                createLeadRoutesBarGraph(pData);
            });




            /*
            *   SECTION - Best Rated Routes
            */
            GymsService.getBestRatedBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedBoulder = pData;
                });

            GymsService.getBestRatedTopRope($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedTopRope = pData;
                });

            GymsService.getBestRatedLead($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedLead = pData;
                });




            /*
            *   SECTION - Scope Bindings
            */
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


            /*
            *   SUBSECTION - Image Upload
            */
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

            $scope.imageUploadComplete = function (content) {
                $scope.image = content;
            };


            $scope.setPanelName = function (pPanelName) {
                $scope.panel = pPanelName
            };


            /*
            *   SECTION - MISC
            */
            // We need to set authorization for the 'upload image' functionality
            $scope.authorization = LoginService.getHeader();

        }]);
