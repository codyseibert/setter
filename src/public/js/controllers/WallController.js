/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

angular.module('SETTER')
    .controller('WallController', [
        '$scope',
        'RoutesService',
        'WallsService',
        '$routeParams',
        'DateFormatService',
        function (
            $scope,
            RoutesService,
            WallsService,
            $routeParams,
            DateFormatService
        ) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;

            $scope.wall = {};
            $scope.routes = [];
            $scope.form = {};

            WallsService.getWall($scope.wallId)
                .success(function (pData) {
                    $scope.wall = pData;
                });

            RoutesService.getRoutesOnWall($scope.wallId)
                .success(function (pData) {
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

                WallsService.deleteWall($scope.wallId)
                    .success(function () {
                        $scope.navigateToWalls($scope.gymId);
                    });
            };

            $scope.save = function () {
                WallsService.updateWall($scope.wallId, $scope.form.name)
                    .success(function () {
                        $scope.isEditMode = false;
                        $scope.wall.name = $scope.form.name;
                    });
            };
        }]);
