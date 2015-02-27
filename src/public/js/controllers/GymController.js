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
        'DateFormatService',
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

            $scope.activity = [];
            $scope.newRoutes = [];
            $scope.alerts = [];

            $scope.boulderRoutesBarGraph = [];
            $scope.topRopeRoutesBarGraph = [];
            $scope.leadRoutesBarGraph = [];

            var getShow = function () {
                return $rootScope.getAccountId() === $scope.gymId ? 'gym' : 'user';
            };
            $rootScope.getAccountId = function () { return 100; };

            var isGymAccount = function () {
              return $rootScope.getAccountId() === $scope.gymId;
            };

            var shows = {
                newest: {
                    boulder: {
                      user: function () { return $scope.newestBoulder && $scope.newestBoulder.length === 0 && !isGymAccount(); },
                      gym: function () { return $scope.newestBoulder && $scope.newestBoulder.length === 0 && isGymAccount(); }
                    },
                    toprope: {
                      user: function () { return $scope.newestTopRope && $scope.newestTopRope.length === 0 && !isGymAccount(); },
                      gym: function () { return $scope.newestTopRope && $scope.newestTopRope.length === 0 && isGymAccount(); }
                    },
                    lead: {
                      user: function () { return $scope.newestLead && $scope.newestLead.length === 0 && !isGymAccount(); },
                      gym: function () { return $scope.newestLead && $scope.newestLead.length === 0 && isGymAccount(); }
                    }
                },
                best: {
                    boulder: {
                      user: function () { return $scope.bestRatedBoulder && $scope.bestRatedBoulder.length === 0 && !isGymAccount();  },
                      gym: function () { return $scope.bestRatedBoulder && $scope.bestRatedBoulder.length === 0 && isGymAccount();  }
                    },
                    toprope: {
                      user: function () { return $scope.bestRatedTopRope && $scope.bestRatedTopeRope.length === 0 && !isGymAccount();  },
                      gym: function () { return $scope.bestRatedTopeRope && $scope.bestRatedTopeRope.length === 0 && isGymAccount();  }
                    },
                    lead: {
                      user: function () { return $scope.bestRatedLead && $scope.bestRatedLead.length === 0 && !isGymAccount();  },
                      gym: function () { return $scope.bestRatedLead && $scope.bestRatedLead.length === 0 && isGymAccount();  }
                    }
                }
            };

            // UNCOMMENT THIS FOR FORCE STATE OF THE BLANK STATES!!!!!

            // shows = {
            //   newest: {
            //     boulder: {
            //       user: function () { return true; },
            //       gym: function () { return true; }
            //     },
            //     toprope: {
            //       user: function () { return true; },
            //       gym: function () { return true; }
            //     },
            //     lead: {
            //       user: function () { return true; },
            //       gym: function () { return true; }
            //     }
            //   },
            //   best: {
            //     boulder: {
            //       user: function () { return true;  },
            //       gym: function () { return true;  }
            //     },
            //     toprope: {
            //       user: function () { return true;  },
            //       gym: function () { return true;  }
            //     },
            //     lead: {
            //       user: function () { return true;  },
            //       gym: function () { return true;  }
            //     }
            //   }
            // };

            var goTos = {
              gymSuggestions: function () { $rootScope.navigateToGymSuggestions($scope.gymId); },
              gymZones: function () { $rootScope.navigateToWalls($scope.gymId); }
            };

            var images = {
              newest: {
                boulder: "images/placeholder--newestBouldering.jpg",
                toprope: "images/placeholder--newestTopRope.jpg",
                lead: "images/placeholder--newestLead.jpg"
              },
              best: {
                boulder: "images/placeholder--bestBouldering.jpg",
                toprope: "images/placeholder--bestTopRope.jpg",
                lead: "images/placeholder--bestLead.jpg"
              }
            };

            $scope.blankStateModels = {

              newest: {

                boulder: {

                  user: {
                    show: shows.newest.boulder.user,
                    content: {
                      title: "This gym has no boulder problems logged yet!",
                      text: "Ask this gym to update their setter profile",
                      link_text: "Leave Gym a Suggestion"
                    },
                    image: images.newest.boulder,
                    click: goTos.gymSuggestions
                  },

                  gym: {
                    show: shows.newest.boulder.gym,
                    content: {
                      title: "You have no routes!",
                      text: "Click below to start adding routes",
                      link_text: "Add Routes"
                    },
                    image: images.newest.boulder,
                    click: goTos.gymZones
                  }
                },


                toprope: {

                  user: {
                    show: shows.newest.toprope.user,
                    content: {
                      title: "This gym has no top rope routes logged yet!",
                      text: "Ask this gym to update their setter profile",
                      link_text: "Leave Gym a Suggestion"
                    },
                    image: images.newest.toprope,
                    click: goTos.gymSuggestions
                  },

                  gym: {
                    show: shows.newest.toprope.gym,
                    content: {
                      title: "You have no top rope routes!",
                      text: "Click below to start adding routes",
                      link_text: "Add Routes"
                    },
                    image: images.newest.toprope,
                    click: goTos.gymZones
                  }
                },


                lead: {

                  user: {
                    show: shows.newest.lead.user,
                    content: {
                      title: "This gym has no lead routes logged yet!",
                      text: "Ask this gym to update their setter profile",
                      link_text: "Leave Gym a Suggestion"
                    },
                    image: images.newest.lead,
                    click: goTos.gymSuggestions
                  },

                  gym: {
                    show: shows.newest.lead.gym,
                    content: {
                      title: "You have no lead routes!",
                      text: "Click below to start adding routes",
                      link_text: "Add Routes"
                    },
                    image: images.newest.lead,
                    click: goTos.gymZones
                  }
                }
              },





              best: {
                boulder: {
                  user: {
                    show: shows.newest.boulder.user,
                    content: {
                      title: "No boulder problems have been rated!",
                      text: "Go ask your buddies to start rating problems!",
                      link_text: ""
                    },
                    image: images.best.boulder,
                    click: goTos.gymSuggestions
                  },
                  gym: {
                    show: shows.newest.boulder.gym,
                    content: {
                      title: "None of your members have rated your routes",
                      text: "Ask your members to start rating problems!",
                      link_text: ""
                    },
                    image: images.best.boulder,
                    click: goTos.gymSuggestions
                  }
                },
                toprope: {
                  user: {
                    show: shows.newest.toprope.user,
                    content: {
                      title: "No top rope routes have been rated!",
                      text: "Go ask your buddies to start rating routes!",
                      link_text: ""
                    },
                    image: images.best.toprope,
                    click: goTos.gymSuggestions
                  },
                  gym: {
                    show: shows.newest.toprope.gym,
                    content: {
                      title: "None of your members have rated your routes",
                      text: "Ask your members to start rating routes!",
                      link_text: ""
                    },
                    image: images.best.toprope,
                    click: goTos.gymSuggestions
                  }
                },
                lead: {
                  user: {
                    show: shows.newest.lead.user,
                    content: {
                      title: "No lead routes have been rated!",
                      text: "Go ask your buddies to start rating routes!",
                      link_text: ""
                    },
                    image: images.best.lead,
                    click: goTos.gymSuggestions
                  },
                  gym: {
                    show: shows.newest.lead.gym,
                    content: {
                      title: "None of your members have rated your routes",
                      text: "Ask your members to start rating routes!",
                      link_text: ""
                    },
                    image: images.best.lead,
                    click: goTos.gymSuggestions
                  }
                }
              }
            };

            $scope.users = [];

            /*
            *   SECTION - Gym related service calls
            */
            GymsService.getGym($scope.gymId, function (pData) {
                $scope.gym = pData;
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
            };


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

            /*
            *   SECTION - Best Rated Routes
            */
            GymsService.getBestRatedBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.bestRatedBoulder = pData;
                    formatDates(pData);
                });

            setTimeout(function () {

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

            var loadStatisticsPanelData = function () {
                RoutesService.getCurrentBoulderRoutes($scope.gymId, function (pData) {
                    createBoulderRoutesBarGraph(pData);
                });

                RoutesService.getCurrentTopRopeRoutes($scope.gymId, function (pData) {
                    createTopRopeRoutesBarGraph(pData);
                });

                RoutesService.getCurrentLeadRoutes($scope.gymId, function (pData) {
                    createLeadRoutesBarGraph(pData);
                });
            };


            /*
            *   SECTION - MISC
            */

            // We need to set authorization for the 'upload image' functionality
            $scope.authorization = LoginService.getHeader();

            $scope.setCurrentTab = function (pCurrentTab) {
                $scope.currentTab = pCurrentTab;

                if (pCurrentTab === $scope.PANEL_STATS) {
                  loadStatisticsPanelData();
                } else if (pCurrentTab === $scope.PANEL_CLIMBERS) {
                  loadClimberPanelData();
                }
            };
        }]);
