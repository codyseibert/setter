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
        '$interval',
        '$routeParams',
        'RoutesService',
        'WallsService',
        'DateFormatService',
        'LoginService',
        'SelectedRouteService',
        function (
            $scope,
            $interval,
            $routeParams,
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

            $scope.wall = {};
            $scope.routes = [];
            $scope.form = {};
            $scope.image = null;

            $scope.routeSelected = false;

            $scope.$watch(function() {
                return SelectedRouteService.offCanvasModalShown;
            }, function(newValue, oldValue) {
                $scope.offCanvasModalShown = newValue;
            });

            /*
                REST Calls
            */
            WallsService.getWall($scope.gymId, $scope.wallId, function (pData) {
                $scope.wall = pData;
            });

            RoutesService.getRoutesOnWall($scope.wallId, function (pData) {
                pData.map(function (pEntry) {
                    pEntry.date = moment(pEntry.date);
                    return pEntry;
                });
                $scope.routes = pData;
            });


            /*
                Button Callbacks
            */
            $scope.edit = function () {
                $scope.isEditMode = !$scope.isEditMode;
                $scope.form.name = $scope.wall.name;
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


            /*
                Hide / Show Logic Logic
            */
            $scope.hasRoutes = function () {
                return $scope.routes.length > 0;
            };

            $scope.shouldShowWallImage = function () {
                return ($scope.image && $scope.image.url && $scope.isUserAccount()) ||
                    $scope.getAccountId() === $scope.gymId;
            };

            $scope.isNew = function (pRoute) {
                return pRoute.date > moment().subtract(7, 'days');
            };



            /*
                Upload Image Logic
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

            $scope.complete = function (content) {
                $scope.image = content;
                WallsService.setWallDirty($scope.wallId);
            };

            $scope.selectRoute = function(route) {
                $scope.routeSelected = route;
                SelectedRouteService.setSelectedRoute(route);
                SelectedRouteService.offCanvasModalShown = true;
            };

            $scope.closeRoute = function () {
                console.log('closed');
                SelectedRouteService.hideModal();
            };

            $scope.isRouteSelected = function() {
                return $scope.routeSelected;
            };

            $scope.authorization = LoginService.getHeader();
        }]);
