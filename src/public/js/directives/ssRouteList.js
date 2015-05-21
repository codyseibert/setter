/*global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false */

angular.module('SETTER')
    .directive('ssRouteList', [
        function () {
            'use strict';

            return {
                scope: {
                  'type': '=',
                  'catagory': '@',
                  'limit': '='
                },
                templateUrl: 'templates/RouteList.tpl.html',
                replace: true,
                restrict: 'E',
                controller: function($scope, $routeParams, GymsService) {
                  var type = $scope.type;
                  var limit = $scope.limit;

                  var gymId = parseInt($routeParams.gymId, 10);

                  $scope.$watch(
                    function () {
                      return $scope.type;
                    },
                    function (newValue, oldValue) {
                      switch ($scope.type) {
                          case 'BOULDERING':
                              GymsService.getBestRatedBoulder(gymId)
                                  .success(function (pData) {
                                      $scope.routes = pData;
                                  });
                              break;
                          case 'TOPROPE':
                              GymsService.getBestRatedTopRope(gymId)
                                  .success(function (pData) {
                                      $scope.routes = pData;
                                  });
                              break;
                          case 'LEAD':
                              GymsService.getBestRatedLead(gymId)
                                  .success(function (pData) {
                                      $scope.routes = pData;
                                  });
                              break;
                          default:
                      }
                    }, true);

                  $scope.increment = function () {
                      $scope.limit += 5;
                  };
                },
                link: function(scope, element, attrs)  {
                  scope.type = attrs.type;
                }
            };
        }]);
