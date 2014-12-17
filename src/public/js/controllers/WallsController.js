/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('WallsController', [
        '$scope',
        'WallsService',
        'GymsService',
        '$routeParams',
        function ($scope,
            WallsService,
            GymsService,
            $routeParams) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.walls = [];

            WallsService.getWallsInGym($scope.gymId)
                .success(function (pData) {
                    $scope.walls = pData;
                });

            GymsService.getGym($scope.gymId)
                .success(function (pData) {
                    $scope.gym = pData;
                });

            $scope.hasWalls = function () {
                return $scope.walls.length > 0;
            };

            $scope.addClicked = function () {
                var wallName = $scope.form.wallName;

                WallsService.createWall(wallName)
                    .success(function (pData) {
                        $scope.walls.push({
                            name: wallName,
                            id: pData.id
                        });
                        $scope.form.wallName = "";
                    });
            };

                $scope.items = [
                "The first choice!",
                "And another choice for you.",
                "but wait! A third!"
              ];

              $scope.linkItems = {
                "Google": "http://google.com",
                "AltaVista": "http://altavista.com"
              };
        }]);
