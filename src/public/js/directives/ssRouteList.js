/*global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false */

angular.module('SETTER')
    .directive('ssRouteList', [
          '$timeout',
        function ($timeout) {
            'use strict';

            return {
                scope: {
                  'activeCategory': '=',
                  'category': '@'
                },
                templateUrl: 'templates/directives/ssRouteList.tpl.html',
                replace: true,
                restrict: 'E',
                controller: [
                  '$scope',
                  '$routeParams',
                  '$rootScope',
                  'SelectedRouteService',
                  'GymsService',
                function(
                  $scope,
                  $routeParams,
                  $rootScope,
                  SelectedRouteService,
                  GymsService
                ) {

                  var gymId = parseInt($routeParams.gymId, 10);
                  var that = this;
                  var MORE = "View More +";
                  var HIDE = "Hide Routes -";

                  $scope.gymId = gymId;
                  $scope.accountId = $rootScope.getAccountId();
                  $scope.step = 5;
                  $scope.initial = 5;
                  $scope.routes = [];
                  $scope.text = MORE;
                  $scope.hasData = false;
                  $scope.loading = true;

                  if ($scope.category === 'best') {
                    $scope.template = 'templates/gym/panels/activity/sections/BestRatedRoutes.tpl.html';
                    $scope.$watch('activeCategory', function() {
                        $scope.limit = $scope.initial;
                        $scope.text = MORE;

                         switch ($scope.activeCategory) {
                             case 'boulder':
                                 GymsService.getBestRatedBoulder(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                         $scope.hasData = pData.length > 0;
                                         $scope.loading = false;
                                     });
                                 break;
                             case 'toprope':
                                 GymsService.getBestRatedTopRope(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                         $scope.hasData = pData.length > 0;
                                       $scope.loading = false;
                                     });
                                 break;
                             case 'lead':
                                 GymsService.getBestRatedLead(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                         $scope.hasData = pData.length > 0;
                                         $scope.loading = false;
                                     });
                                 break;
                             default:

                         }

                    });
                  } else {
                    $scope.template = 'templates/gym/panels/activity/sections/LatestRoutes.tpl.html';
                    $scope.$watch('activeCategory', function() {
                        $scope.limit = $scope.initial;
                        $scope.text = MORE;

                         switch ($scope.activeCategory) {
                             case 'boulder':
                                 GymsService.getNewestBoulder(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                         $scope.hasData = pData.length > 0;
                                         $scope.loading = false;
                                     });
                                 break;
                             case 'toprope':
                                 GymsService.getNewestTopRope(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                         $scope.hasData = pData.length > 0;
                                         $scope.loading = false;
                                     });
                                 break;
                             case 'lead':
                                 GymsService.getNewestLead(gymId)
                                     .success(function (pData) {
                                         $scope.routes = pData;
                                         $scope.hasData = pData.length > 0;
                                         $scope.loading = false;
                                     });
                                 break;
                             default:

                         }

                    });
                  }

                  this.getCategory = function () {
                    return $scope.category;
                  }

                  this.getActiveCategory = function () {
                    return $scope.activeCategory;
                  }

                  this.incrementLimitReached = function() {
                    return $scope.limit >= $scope.routes.length
                  };

                  this.refreshText = function () {
                    if (that.incrementLimitReached()) {
                      $scope.text = HIDE;
                    } else {
                      $scope.text = MORE;
                    }
                  };

                  $scope.hasLessThanLimit = function () {
                    return $scope.routes.length <= $scope.initial;
                  };

                  $scope.openRouteModal = function (route) {
                      $rootScope.openRouteModal(route)
                  };

                  $scope.placeholderClick = function () {
                    if ($rootScope.getAccountId() === gymId) {
                      $rootScope.navigateToWalls(gymId);
                    } else {
                      $rootScope.navigateToGymSuggestions(gymId);
                    }
                  }
                }],
                link: function(scope, element, attrs, ctrl)  {
                  scope.clicked = function () {

                    if (!ctrl.incrementLimitReached()) {
                      scope.loadingMore = true;
                      $timeout(function() {
                        scope.limit += scope.step;
                        scope.loadingMore = false;
                        ctrl.refreshText();
                      }, 200);

                    } else {

                        scope.limit = scope.initial;
                        ctrl.refreshText();

                    }

                  }

                  //TO:DO Separate this function from the route list
                  //by using ss-placeholder directive
                  scope.$watch('activeCategory', function () {
                    if (scope.activeCategory) {
                      scope.placeholderImage = 'images/placeholder--' + scope.category + scope.activeCategory.replace(' ', '') +'.jpg'
                    }

                    if (scope.accountId === scope.gymId) {
                      scope.placeholderTitle = "Oops! These aren't your newest lead routes.";
                      scope.placeholderText = "There aren't any here right now, but you can set new ones on the";
                      scope.placeholderLinkTest = " Manage Zones page";
                    } else {
                      scope.placeholderTitle = "Bummer, this gym has no " + scope.activeCategory + " yet.";
                      scope.placeholderText = "If you'd like to climb some, let them know over at their";
                      scope.placeholderLinkTest = " Suggestions board.";
                    }
                  });

                }
            };
        }]);
