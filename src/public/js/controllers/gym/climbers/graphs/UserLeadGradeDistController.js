/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('UserLeadGradeDistController', [
        '$scope',
        '$routeParams',
        'GymUsersService',
        'BarGraphHelperService',
        function (
            $scope,
            $routeParams,
            GymUsersService,
            BarGraphHelperService

        ) {
            'use strict';


            var gymId = parseInt($routeParams.gymId);

            $scope.leaders = GymUsersService.getLead().query({gymId: $routeParams.gymId}, function() {
                $scope.graph = BarGraphHelperService.generateRouteCountGraphData($scope.leaders);
            });

        }]);
