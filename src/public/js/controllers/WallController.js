/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

angular.module('SETTER')
    .controller('WallController', [
        '$scope',
        '$interval',
        '$routeParams',
        'RoutesService',
        'WallsService',
        'DateFormatService',
        'LoginService',
        function (
            $scope,
            $interval,
            $routeParams,
            RoutesService,
            WallsService,
            DateFormatService,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.wallId = parseInt($routeParams.wallId, 10);

            $scope.wall = {};
            $scope.routes = [];
            $scope.form = {};
            $scope.image = null;

            WallsService.getWall($scope.gymId, $scope.wallId, function (pData) {
                $scope.wall = pData;
                $scope.image = {
                    url: pData.url
                };
            });

            RoutesService.getRoutesOnWall($scope.wallId, function (pData) {
                pData.map(function (pEntry) {
                    pEntry.date = moment(pEntry.date);
                    return pEntry;
                });

                $scope.routes = pData;
            });

            $scope.hasRoutes = function () {
                return $scope.routes.length > 0;
            };

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

            $scope.shouldShowWallImage = function () {
                return ($scope.image && $scope.image.url && $scope.isUserAccount()) ||
                    $scope.getAccountId() === $scope.gymId
            };

            $scope.isNew = function (pRoute) {
                return pRoute.date > moment().subtract(7, 'days');
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
                WallsService.setWallDirty($scope.wallId);
            };

            $scope.authorization = LoginService.getHeader();
        }]);
