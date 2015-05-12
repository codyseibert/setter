/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('UserTopRopeGradeDistController', [
        '$scope',
        '$rootScope',
        '$routeParams',
        'RoutesService',
        'GymsService',
        'DateFormatService',
        'SelectedRouteService',
        function (
            $scope,
            $rootScope,
            $routeParams,
            RoutesService,
            GymsService,
            DateFormatService,
            SelectedRouteService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);

        }]);
