/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false */

angular.module('SETTER')
    .controller('WallsController', [
        '$scope',
        '$routeParams',
        'WallsService',
        'LoginService',
        'GymsService',
        function (
            $scope,
            $routeParams,
            WallsService,
            LoginService,
            GymsService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }


            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.walls = [];
            $scope.loading = true;
            $scope.hasNoWalls = false;

            $scope.types = [{
              name: 'Bouldering',
              value: 0
            },{
              name: 'Top Rope',
              value: 1
            },{
              name: 'Lead',
              value: 2
            }];

            GymsService.getGymSettings($scope.gymId)
              .success(function(settings) {
                  console.log(settings);
              });

            $scope.backButtonActive = true;

            $scope.form = {
                filter: '',
                zoneType: $scope.types[0]
            };

            $scope.checkForWalls = function (pWalls) {
                if(pWalls.length === 0) {
                    $scope.hasNoWalls = true;
                    console.log($scope.hasNowalls);
                }
                else {
                    return;
                }
            };

            WallsService.getWallsInGym($scope.gymId, function (pData) {
                console.log(pData);
                $scope.walls = pData;
                $scope.checkForWalls($scope.walls);
                $scope.loading = false;
            });

            $scope.addClicked = function () {
                var wallName = $scope.form.wallName;
                var zoneType = $scope.form.zoneType.value;

                WallsService.createWall($scope.gymId, wallName, zoneType)
                    .success(function (pData) {
                        $scope.walls.push({
                            name: wallName,
                            id: pData.id,
                            route_count: 0,
                            type: zoneType
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
