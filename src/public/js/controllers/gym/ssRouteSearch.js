/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('ssRouteSearchController', [
        '$scope',
        '$routeParams',
        '$rootScope',
        '$interval',
        'GymsService',
        'RoutesService',
        'BarGraphHelperService',
        'UsersService',
        'LoginService',
        'AlertsService',
        'GymUsersService',
        function (
            $scope,
            $routeParams,
            $rootScope,
            $interval,
            GymsService,
            RoutesService,
            BarGraphHelperService,
            UsersService,
            LoginService,
            AlertsService,
            GymUsersService
        ) {
            'use strict';
            $scope.gymId = parseInt($routeParams.gymID)

            GymsService.getAllCurrentRoutes($scope.gymId)
              .success(function (data) {
                  console.log('data', data);
              });
    }]);
