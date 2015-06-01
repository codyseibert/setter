/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false */

angular.module('SETTER')
    .controller('WallsController', [
        '$scope',
        '$routeParams',
        'WallsService',
        'LoginService',
        function (
            $scope,
            $routeParams,
            WallsService,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.walls = [];
            $scope.loading = true;

            $scope.backButtonActive = true;

            $scope.form = {
                filter: ''
            };

            WallsService.getWallsInGym($scope.gymId, function (pData) {
                $scope.walls = pData;
                $scope.loading = false;
            });

            $scope.hasWalls = function () {
                return $scope.walls.length > 0;
            };

            $scope.addClicked = function () {
                var wallName = $scope.form.wallName;

                WallsService.createWall($scope.gymId, wallName)
                    .success(function (pData) {
                        $scope.walls.push({
                            name: wallName,
                            id: pData.id,
                            route_count: 0
                        });
                        $scope.form.wallName = "";
                        WallsService.setWallsDirty($scope.gymId);
                    });
            };

            $scope.applyFilter = function () {
                var filter = $scope.form.filter.toUpperCase();
                $scope.walls.map(function (pEntry) {
                    if (pEntry.name.toUpperCase().indexOf(filter) !== -1) {
                        pEntry.hide = false;
                    } else {
                        pEntry.hide = true;
                    }
                    return pEntry;
                });
            };

            $scope.isNew = function (pWall) {
                return moment(pWall.last_update) > moment().subtract(7, 'days');
            };
        }]);
