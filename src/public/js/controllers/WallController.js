    /*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

/*
    Controller:
        WallController

    Template:
        Wall.tpl.html
*/
angular.module('SETTER')
    .controller('WallController', [
        '$scope',
        '$rootScope',
        '$interval',
        '$routeParams',
        '$filter',
        'RoutesService',
        'WallsService',
        'DateFormatService',
        'LoginService',
        'SelectedRouteService',
        function (
            $scope,
            $rootScope,
            $interval,
            $routeParams,
            $filter,
            RoutesService,
            WallsService,
            DateFormatService,
            LoginService,
            SelectedRouteService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            /*
                Init
            */
            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.wallId = parseInt($routeParams.wallId, 10);
            $rootScope.gymId = $scope.gymId;
            $rootScope.wallId = $scope.wallId;

            $scope.wall = {};
            $scope.routes = [];
            $scope.form = {};
            $scope.image = null;

            $scope.hasNoRoutes = false; 

            $scope.routeSelected = false;
            $scope.loading = true; 


                        /*
                Hide / Show Logic Logic
            */
            $scope.checkForRoutes = function (pRoutes) {
                if(pRoutes.length === 0) {
                    $scope.hasNoRoutes = true; 
                }
                else {
                    return 
                }
                
            };
            
            var loadRoutes = function () {
                RoutesService.getRoutesOnWall($scope.wallId, function (pData) {
                    pData.map(function (pEntry) {
                        pEntry.date = moment(pEntry.date);
                        return pEntry;
                    });
                    $scope.routes = pData;
                    $scope.checkForRoutes($scope.routes); 
                    $scope.loading = false; 
                });
            };

            $scope.$watch(function() {
                return $rootScope.refreshWall;
            }, function(newValue, oldValue) {
                if (newValue === true) {
                    WallsService.setWallDirty($scope.wallId);
                    loadRoutes();
                    $rootScope.refreshWall = false;
                };
            });

            $scope.$watch(function() {
                return $rootScope.sendRoute;
            }, function(newValue, oldValue) {
                if (newValue !== null) {
                    var found;
                    found = $filter('filter')($scope.routes, {id: newValue}, true);
                    if (found.length) {
                      found[0].send = true;
                    }
                    $rootScope.sendRoute = null;
                };
            });

            $scope.$watch(function() {
                return $rootScope.unsendRoute;
            }, function(newValue, oldValue) {
                if (newValue !== null) {
                    var found;
                    found = $filter('filter')($scope.routes, {id: newValue}, true);
                    if (found.length) {
                      found[0].send = null;
                    }
                    $rootScope.unsendRoute = null;
                };
            });

            $scope.$watch(function() {
                return $rootScope.routeRated;
            }, function(newValue, oldValue) {
                if (newValue) {
                    var found;
                    found = $filter('filter')($scope.routes, {id: newValue[0]}, true);
                    if (found.length) {
                      found[0].rating = newValue[1];
                    }
                    $rootScope.routeRated = null;
                };
            }, true);

            /*
                REST Calls
            */
            WallsService.getWall($scope.gymId, $scope.wallId, function (pData) {
                $scope.wall = pData;
            });

            loadRoutes();

            /*
                Button Callbacks
            */
            $scope.openRouteModal = function (route) {
                var found;
                $rootScope.openRouteModal(route);

                found = $filter('filter')($scope.routes, {id: route.id}, true);
                found[0].isNew = null;
            };

            $scope.edit = function () {
                $scope.isEditMode = !$scope.isEditMode;
                $scope.form.name = $scope.wall.name;
            };

            $scope.openCreateRouteModal = function() {
                $rootScope.openModal();
                $rootScope.routeModalViewType = 'create';
            };

            $scope.delete = function () {
                var yes = confirm('Are you sure you want to delete "' + $scope.wall.name + '"?');
                if (!yes) {
                    return;
                }

                WallsService.deleteWall($scope.gymId, $scope.wallId)
                    .success(function () {
                        $scope.navigateToWalls($scope.gymId);
                    });
            };

            $scope.save = function () {
                WallsService.updateWall($scope.gymId, $scope.wallId, $scope.form.name)
                    .success(function () {
                        $scope.isEditMode = false;
                        $scope.wall.name = $scope.form.name;
                    });
            };

            $scope.stripZone = function (pGymId, pWallId) {
                var yes = confirm('Are you sure you want to strip this entire zone?');
                if (!yes) {
                    return;
                }

                WallsService.stripZone($scope.gymId, $scope.wallId)
                    .success(function () {
                        $scope.routes.splice(0, $scope.routes.length);
                    });
            };




            $scope.shouldShowWallImage = function () {
                return ($scope.image && $scope.image.url && $scope.isUserAccount()) ||
                    $scope.getAccountId() === $scope.gymId;
            };

            $scope.isNew = function (pRoute) {
                return pRoute.date > moment().subtract(7, 'days');
            };



            $scope.authorization = LoginService.getHeader();
        }]);
