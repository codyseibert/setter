/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

angular.module('SETTER')
    .controller('WallController', [
        '$scope',
        'WallsService',
        'SetsService',
        '$routeParams',
        'DateFormatService',
        function ($scope,
            WallsService,
            SetsService,
            $routeParams,
            DateFormatService) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;

            $scope.sets = [];
            $scope.wall = {};

            $scope.form = {};

            WallsService.getWall($scope.wallId)
                .success(function (pData) {
                    $scope.wall = pData;
                });

            SetsService.getSetsOnWall($scope.wallId)
                .success(function (pData) {
                    var i;

                    $scope.sets = pData;

                    for (i = 0; i < pData.length; i += 1) {
                        pData[i].date = DateFormatService.format(pData[i].date);
                    }
                });

            $scope.hasSets = function () {
                return $scope.sets.length > 0;
            };

            $scope.addClicked = function () {
                SetsService.createSet($scope.wallId)
                    .success(function (pData) {
                        $scope.sets.unshift({
                            id: pData.id,
                            date: DateFormatService.format(moment())
                        });
                    });
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
