/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('GymController', [
        '$scope',
        '$routeParams',
        '$rootScope',
        '$interval',
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
            GymsService,
            RoutesService,
            BarGraphHelperService,
            UsersService,
            LoginService,
            AlertsService,
            GymUsersService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            var createBoulderRoutesBarGraph,
                createTopRopeRoutesBarGraph,
                createLeadRoutesBarGraph;

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $rootScope.gymId = $scope.gymId;


            $scope.BOULDERING = 'Bouldering';
            $scope.TOPROPE = 'Top Rope';
            $scope.LEAD = 'Lead';

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
            $scope.typeNewestCurrent = $scope.BOULDERING;
            $scope.typeBest = $scope.BOULDERING;
            $scope.typeBestCurrent = $scope.BOULDERING;

            $scope.activity = [];
            $scope.newRoutes = [];
            $scope.alerts = [];

            $scope.boulderRoutesBarGraph = [];
            $scope.topRopeRoutesBarGraph = [];
            $scope.leadRoutesBarGraph = [];

            $scope.users = [];

            $scope.routeSelected = false;
            $scope.offCanvasModalShown = false;

            /*
            *   SECTION - Gym related service calls
            */
            GymsService.getGym($scope.gymId, function (pData) {
                $scope.gym = pData;
                $scope.gymName = $scope.gym.name;
            });


            var loadClimberPanelData = function () {

              GymsService.getHomeGymUsers($scope.gymId, function (pData) {
                var i;
                for (i = 0; i < pData.length; i += 1) {
                  if (pData[i].name === 'Guest Setter') {
                    pData.splice(i, 1);
                  }
                }
                $scope.users = pData;
              });

              GymUsersService.getUserGrades('bouldering').query({gymId: $scope.gymId}, function(pData) {
                  pData.$promise.then(function(data) {
                      $scope.boulderingUsersGraphData = BarGraphHelperService.preprocess(data);
                  });
              });

              GymUsersService.getUserGrades('toprope').query({gymId: $scope.gymId}, function(pData) {
                  pData.$promise.then(function(data) {
                      $scope.topropeUsersGraphData = BarGraphHelperService.preprocess(data);
                  });
              });

              GymUsersService.getUserGrades('lead').query({gymId: $scope.gymId}, function(pData) {
                  pData.$promise.then(function(data) {
                      $scope.leadUsersGraphData = BarGraphHelperService.preprocess(data);
                  });
              });

            };


            GymsService.getGymImage($scope.gymId, function (pData) {
                $scope.image = $rootScope.getGymImageSrc(pData);
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
                        pEntry.date = pEntry.date;
                        return pEntry;
                    });
                    $scope.alerts = pData;
                });




            /*
            *   SECTION - Distribution Graphs
            */
            // createBoulderRoutesBarGraph = function (pData) {
            //     var data = BarGraphHelperService
            //         .generateRouteCountGraphData(pData);
            //     $scope.boulderRoutesBarGraph = data;
            // };
            //
            // createTopRopeRoutesBarGraph = function (pData) {
            //     var data = BarGraphHelperService
            //         .generateRouteCountGraphData(pData);
            //     $scope.topRopeRoutesBarGraph = data;
            // };
            //
            // createLeadRoutesBarGraph = function (pData) {
            //     var data = BarGraphHelperService
            //         .generateRouteCountGraphData(pData);
            //     $scope.leadRoutesBarGraph = data;
            // };

            /*
            *   SECTION - Newest Routes
            */
            GymsService.getNewestBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.newestBoulder = pData;
                });

            /*
            *   SECTION - Best Rated Routes
            */
            GymsService.getBestRatedBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedBoulder = pData;
                });

            setTimeout(function () {

                GymsService.getNewestTopRope($scope.gymId)
                    .success(function (pData) {
                        $scope.newestTopRope = pData;
                    });

                GymsService.getNewestLead($scope.gymId)
                    .success(function (pData) {
                        $scope.newestLead = pData;
                    });



                GymsService.getBestRatedTopRope($scope.gymId)
                    .success(function (pData) {
                        $scope.bestRatedTopRope = pData;
                    });

                GymsService.getBestRatedLead($scope.gymId)
                    .success(function (pData) {
                        $scope.bestRatedLead = pData;
                    });
            }, 1000);

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
                return $scope.newestBoulder && $scope.newestBoulder.length > 0;
            };

            $scope.hasTopRope = function () {
                return $scope.newestTopRope && $scope.newestTopRope.length > 0;
            };

            $scope.hasLead = function () {
                return $scope.newestLead && $scope.newestLead.length > 0;
            };

            $scope.hasRatedBoulder = function () {
                return $scope.bestRatedBoulder && $scope.bestRatedBoulder.length > 0;
            };

            $scope.hasRatedTopRope = function () {
                return $scope.bestRatedTopRope && $scope.bestRatedTopRope.length > 0;
            };

            $scope.hasRatedLead = function () {
                return $scope.bestRatedLead && $scope.bestRatedLead.length > 0;
            };




            /*
            *   SECTION - Scope Bindings
            */
            $scope.setHomeGym = function () {
                var yes = confirm("Are you sure you want to make " + $scope.gymName + " your new home gym?");
                if (!yes) {
                    return;
                }

                UsersService.setHomeGym($scope.gymId)
                    .success(function () {
                        $rootScope.homeGymId = $scope.gymId;
                        LoginService.setHomeGymId($scope.gymId);
                        alert($scope.gymName + " now set as your home gym!");
                    });
            };


            /*
            *   SECTION - Image
            */
            $scope.fileNameChanged = function () {
              $scope.isUploadingImage = true;
              angular.element("#image_submit").trigger('click');
            };

            $scope.imageUploadComplete = function (content) {
                $scope.isUploadingImage = false;
                $scope.image = content;
                LoginService.setImageUrl(content.url);
                UsersService.setImageAsDirty(LoginService.getAccountId());
            };

            $scope.setTypeNewest = function (pType) {
                $scope.typeNewest = pType;
                $scope.typeNewestCurrent = pType;
            };

            $scope.setTypeBest = function (pType) {
                $scope.typeBest = pType;
                $scope.typeBestCurrent = pType;
            };

            var loadStatisticsPanelData = function () {
                RoutesService.getDistributions($scope.gymId, 'bouldering')
                  .success(function(data){
                    $scope.boulderingGraphData = BarGraphHelperService.preprocess(data);
                  });

                RoutesService.getDistributions($scope.gymId, 'toprope')
                  .success(function(data){
                    $scope.topropeGraphData = BarGraphHelperService.preprocess(data);
                  });

                RoutesService.getDistributions($scope.gymId, 'lead')
                  .success(function(data){
                    $scope.leadGraphData = BarGraphHelperService.preprocess(data);
                  });
            };


            /*
            *   SECTION - MISC
            */

            // We need to set authorization for the 'upload image' functionality
            $scope.authorization = LoginService.getHeader();

            $scope.setCurrentTab = function (pCurrentTab) {
                // Visually switch between tabs on the UI
                $scope.currentTab = pCurrentTab;

                // Precache the data
                if (pCurrentTab === $scope.PANEL_STATS) {
                  loadStatisticsPanelData();
                } else if (pCurrentTab === $scope.PANEL_CLIMBERS) {
                  loadClimberPanelData();
                }
            };





        }]);
