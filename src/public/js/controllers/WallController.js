/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false */

angular.module('SETTER')
    .controller('WallController', [
        '$scope',
        'WallsService',
        'SetsService',
        '$routeParams',
        function ($scope,
            WallsService,
            SetsService,
            $routeParams) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;

            $scope.sets = [];
            $scope.wall = {};

            WallsService.getWall($scope.wallId)
                .success(function (pData) {
                    $scope.wall = pData;
                });

            SetsService.getSetsOnWall($scope.wallId)
                .success(function (pData) {
                    $scope.sets = pData;
                });

            $scope.hasSets = function () {
                return $scope.sets.length > 0;
            };

            $scope.addClicked = function () {
                SetsService.createSet($scope.wallId)
                    .success(function (pData) {
                        $scope.sets.push({
                            id: pData.id,
                            date: moment()
                        });
                    });
            };
        }]);
