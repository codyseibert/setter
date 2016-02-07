/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('routeSearchController', [
        '$scope',
        '$routeParams',
        '$rootScope',
        '$interval',
        '$filter',
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
            $filter,
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

            $scope.routes = []; 
            $scope.routeSelected = false;
            

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

            //Wathces for user sending/unsending routes
            $scope.$watch(function() {
                return $rootScope.sendRoute;
            }, function(newValue, oldValue) {
                if (newValue !== null) {
                    var found;
                    found = $filter('filter')($scope.routes, {id: newValue}, true);
                    if (found.length) {
                      found[0].send = true;
                    }
                    $rootScope.sendRoute = null;
                };
            });

            $scope.$watch(function() {
                return $rootScope.unsendRoute;
            }, function(newValue, oldValue) {
                if (newValue !== null) {
                    var found;
                    found = $filter('filter')($scope.routes, {id: newValue}, true);
                    if (found.length) {
                      found[0].send = null;
                    }
                    $rootScope.unsendRoute = null;
                };
            });

            $scope.$watch(function() {
                return $rootScope.routeRated;
            }, function(newValue, oldValue) {
                if (newValue) {
                    var found;
                    found = $filter('filter')($scope.routes, {id: newValue[0]}, true);
                    if (found.length) {
                      found[0].rating = newValue[1];
                    }
                    $rootScope.routeRated = null;
                };
            }, true);


            $scope.openRouteModal = function (route) {
                var found;
                $rootScope.openRouteModal(route);

                found = $filter('filter')($scope.routes, {id: route.id}, true);
                found[0].isNew = null;
            };


    }]);
