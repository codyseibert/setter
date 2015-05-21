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

            GymUsersService.getBouldering().query({gymId: gymId}, function(pData) {
                pData.$promise.then(function(data) {
                    $scope.graph = BarGraphHelperService.labelParams(data);
                });
            });

        }]);
