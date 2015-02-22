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
            DateFormatService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            var createBoulderRoutesBarGraph,
                createTopRopeRoutesBarGraph,
                createLeadRoutesBarGraph,
                formatDates;

            $scope.gymId = parseInt($routeParams.gymId, 10);

            $scope.BOULDERING = 'bouldering';
            $scope.TOPROPE = 'toprope';
            $scope.LEAD = 'lead';

            // Displaying Tab Logic
            $scope.PANEL_ACTIVITY = 'activity';
            $scope.PANEL_STATS = 'stats';
            $scope.PANEL_CLIMBERS = 'climbers';
            $scope.currentTab = $scope.PANEL_ACTIVITY;

            $scope.PANEL_ACTIVITY = 'ACTIVITY';
            $scope.PANEL_STATS = 'STATS';
            $scope.PANEL_CLIMBERS = 'CLIMBERS';
            $scope.panel = $scope.PANEL_ACTIVITY;
            $scope.options = {};
            $scope.form = {};
            $scope.typeNewest = $scope.BOULDERING;
            $scope.typeBest = $scope.BOULDERING;

            $scope.bestRatedBoulder = [];
            $scope.bestRatedLead = [];
            $scope.bestRatedTopRope = [];
            $scope.activity = [];
            $scope.newRoutes = [];
            $scope.alerts = [];
            $scope.boulderRoutesBarGraph = [];
            $scope.topRopeRoutesBarGraph = [];
            $scope.leadRoutesBarGraph = [];
            $scope.newestLead = [];
            $scope.newestBoulder = [];
            $scope.newestTopRope = [];
            $scope.users = [];


            /*
            *   SECTION - Gym related service calls
            */
            GymsService.getGym($scope.gymId, function (pData) {
                $scope.gym = pData;
            });

            GymsService.getHomeGymUsers($scope.gymId, function (pData) {
                var i;
                for (i = 0; i < pData.length; i += 1) {
                    if (pData[i].name === 'Guest Setter') {
                        pData.splice(i, 1);
                    }
                }
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
                Formats all the dates in the array for the front end templates
                TODO: convert to use angular filters in templates
            */
            formatDates = function (pData) {
                var i,
                    length;

                for (i = 0, length = pData.length; i < length; i += 1) {
                    pData[i].date_format = DateFormatService.format(pData[i].date);
                }
            };



            /*
            *   SECTION - Newest Routes
            */
            GymsService.getNewestBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.newestBoulder = pData;
                    formatDates(pData);
                });

            GymsService.getNewestTopRope($scope.gymId)
                .success(function (pData) {
                    $scope.newestTopRope = pData;
                    formatDates(pData);
                });

            GymsService.getNewestLead($scope.gymId)
                .success(function (pData) {
                    $scope.newestLead = pData;
                    formatDates(pData);
                });



            /*
            *   SECTION - Best Rated Routes
            */
            GymsService.getBestRatedBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedBoulder = pData;
                    formatDates(pData);
                });

            GymsService.getBestRatedTopRope($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedTopRope = pData;
                    formatDates(pData);
                });

            GymsService.getBestRatedLead($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedLead = pData;
                    formatDates(pData);
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

            $scope.hasUsers = function () {
                return $scope.users.length > 0;
            };

            $scope.hasAnnouncements = function () {
                return $scope.alerts.length > 0;
            };

            $scope.hasActivity = function () {
                return $scope.activity.length > 0;
            };

            $scope.hasBoulder = function () {
                return $scope.newestBoulder.length > 0;
            };

            $scope.hasTopRope = function () {
                return $scope.newestTopRope.length > 0;
            };

            $scope.hasLead = function () {
                return $scope.newestLead.length > 0;
            };

            $scope.hasRatedBoulder = function () {
                return $scope.bestRatedBoulder.length > 0;
            };

            $scope.hasRatedTopRope = function () {
                return $scope.bestRatedTopRope.length > 0;
            };

            $scope.hasRatedLead = function () {
                return $scope.bestRatedLead.length > 0;
            };

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
                LoginService.setImageUrl(content.url);
                UsersService.setImageAsDirty(LoginService.getAccountId());
            };

            $scope.setTypeNewest = function (pType) {
                $scope.typeNewest = pType;
            };

            $scope.setTypeBest = function (pType) {
                $scope.typeBest = pType;
            };



            /*
            *   SECTION - MISC
            */

            // We need to set authorization for the 'upload image' functionality
            $scope.authorization = LoginService.getHeader();

            $scope.setCurrentTab = function (pCurrentTab) {
                $scope.currentTab = pCurrentTab;
            };
        }]);
