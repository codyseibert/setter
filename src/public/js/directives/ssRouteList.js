/*global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false */

angular.module('SETTER')
    .directive('ssRouteList', [
        function (
                $routeParams,
                $rootScope,
                SelectedRouteService) {
            'use strict';

            return {
                scope: {
                  'activeCategory': '=',
                  'category': '@',
                  'limit': '='
                },
                templateUrl: 'templates/RouteList.tpl.html',
                replace: true,
                restrict: 'E',
                controller: function(
                  $scope,
                  $routeParams,
                  $rootScope,
                  SelectedRouteService,
                  GymsService
                ) {

                  $scope.openRouteModal = function (route) {
                      $rootScope.openRouteModal(route)
                  };

                  var gymId = parseInt($routeParams.gymId, 10);

                  $scope.limit = 5;
                  $scope.incrementLimit = 2;
                  // BEST
                  if ($scope.category === 'best') {
                    $scope.template = 'templates/gym/panels/activity/sections/BestRatedRoutes.tpl.html';
                    $scope.$watch('activeCategory', function() {
                         switch ($scope.activeCategory) {
                             case 'Bouldering':
                                 GymsService.getBestRatedBoulder(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                     });
                                 break;
                             case 'Top Rope':
                                 GymsService.getBestRatedTopRope(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                     });
                                 break;
                             case 'Lead':
                                 GymsService.getBestRatedLead(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                     });
                                 break;
                             default:

                         }

                    });
                  } else {
                    $scope.template = 'templates/gym/panels/activity/sections/LatestRoutes.tpl.html';
                    $scope.$watch('activeCategory', function() {
                         switch ($scope.activeCategory) {
                             case 'Bouldering':
                                 GymsService.getNewestBoulder(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                     });
                                 break;
                             case 'Top Rope':
                                 GymsService.getNewestTopRope(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                     });
                                 break;
                             case 'Lead':
                                 GymsService.getNewestLead(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                     });
                                 break;
                             default:

                         }

                    });
                  }

                  $scope.getIncrementLimit = function() {
                    return $scope.incrementLimit;
                  };

                  $scope.incrementLimitReached = function() {
                    return this.getIncrementLimit() == 0;
                  };
                },
                link: function(scope, element, attrs, ctrl)  {
                  scope.increment = function () {
                      scope.limit += 5
                      scope.incrementLimit = scope.incrementLimit - 1;
                  };
                  scope.decrease = function () {
                      scope.limit -= 10
                      scope.incrementLimit = scope.incrementLimit + 2;
                  };

                }
            };
        }]);
