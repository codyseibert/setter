/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

angular.module('SETTER')
    .controller('WallController', [
        '$scope',
        '$routeParams',
        'RoutesService',
        'WallsService',
        'DateFormatService',
        'LoginService',
        function (
            $scope,
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

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;

            $scope.wall = {};
            $scope.routes = [];
            $scope.form = {};

            WallsService.getWall($scope.gymId, $scope.wallId)
                .success(function (pData) {
                    $scope.wall = pData;
                });

            RoutesService.getRoutesOnWall($scope.wallId)
                .success(function (pData) {
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

            $scope.isNew = function (pRoute) {
                return pRoute.date > moment().subtract(7, 'days');
            };
        }]);
