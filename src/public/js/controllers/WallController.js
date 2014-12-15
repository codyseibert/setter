/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false */

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
        }]);
