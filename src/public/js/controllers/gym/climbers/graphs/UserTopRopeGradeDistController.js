/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('UserTopRopeGradeDistController', [
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

            GymUsersService.getTopRope().query({gymId: gymId}, function(pData) {
                pData.$promise.then(function(data) {
                    $scope.graph = BarGraphHelperService.labelParams(data, true);
                });
            });

        }]);
