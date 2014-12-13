/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('GymWallsController', [
        '$scope',
        'WallsService',
        '$routeParams',
        function ($scope,
            WallsService,
            $routeParams) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.walls = [];

            WallsService.getWallsInGym($scope.gymId)
                .success(function (pData) {
                    $scope.walls = pData;
                });

            $scope.hasWalls = function () {
                return $scope.walls.length > 0;
            };

            $scope.addClicked = function () {
                var wallName = $scope.form.name;

                WallsService.createWall(wallName)
                    .success(function (pData) {
                        $scope.walls.push({
                            name: wallName,
                            id: pData.id
                        });
                        $scope.form.name = "";
                    });
            };
        }]);
