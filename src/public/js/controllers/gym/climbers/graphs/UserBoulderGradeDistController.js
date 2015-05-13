/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('UserBoulderGradeDistController', [
        '$scope',
        '$routeParams',
        'GymUsersService',
        'BarGraphHelperService',
        'RoutesService',
        function (
            $scope,
            $routeParams,
            GymUsersService,
            BarGraphHelperService,
            RoutesService

        ) {
            'use strict';

            var gymId = parseInt($routeParams.gymId);

            $scope.boulderers = GymUsersService.getBouldering().query({gymId: $routeParams.gymId}, function() {
                $scope.graph = BarGraphHelperService.generateRouteCountGraphData($scope.boulderers);
            });


        }]);
