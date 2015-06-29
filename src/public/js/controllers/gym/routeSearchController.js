/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('routeSearchController', [
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
            $scope.gymId = parseInt($routeParams.gymId)
            $scope.loading = true; 


            GymsService.getGym($scope.gymId, function (pData) {
                $scope.gym = pData;
                $scope.gymName = $scope.gym.name;
            });


            GymsService.getAllCurrentRoutes($scope.gymId)
              .success(function (pData) {
                  $scope.routes = pData; 
                  $scope.loading = false; 
              }).error(function() {
                $scope.loading = false; 
              });

    }]);
