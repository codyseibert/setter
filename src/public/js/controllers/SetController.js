/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false */

angular.module('SETTER')
    .controller('SetController', [
        '$scope',
        'RoutesService',
        'SetsService',
        '$routeParams',
        function ($scope,
            RoutesService,
            SetsService,
            $routeParams) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;
            $scope.setId = $routeParams.setId;

            $scope.set = {};
            $scope.routes = [];

            SetsService.getSet($scope.setId)
                .success(function (pData) {
                    $scope.set = pData;
                });

            RoutesService.getRoutesInSet($scope.setId)
                .success(function (pData) {
                    $scope.routes = pData;
                });

            $scope.hasRoutes = function () {
                return $scope.routes.length > 0;
            };
        }]);
