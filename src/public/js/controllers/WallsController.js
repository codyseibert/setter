/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('WallsController', [
        '$scope',
        '$routeParams',
        'WallsService',
        'GymsService',
        'LoginService',
        function (
            $scope,
            $routeParams,
            WallsService,
            GymsService,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.gymId = $routeParams.gymId;
            $scope.walls = [];

            $scope.form = {
                filter: ''
            };

            WallsService.getWallsInGym($scope.gymId, $scope.gymId)
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

                WallsService.createWall($scope.gymId, wallName)
                    .success(function (pData) {
                        $scope.walls.push({
                            name: wallName,
                            id: pData.id
                        });
                        $scope.form.wallName = "";
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
