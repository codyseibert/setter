/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('LatestBoulderController', [
        '$scope',
        '$rootScope',
        '$routeParams',
        'GymsService',
        'DateFormatService',
        function (
            $scope,
            $rootScope,
            $routeParams,
            GymsService,
            DateFormatService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);

            var showForUser = function () {
                return $scope.latestBoulder !== undefined
                    && $scope.latestBoulder.length === 0
                    && $rootScope.getAccountId() !== $scope.gymId
            };

            var showForGym = function () {
                return $scope.latestBoulder !== undefined
                    && $scope.latestBoulder.length === 0
                    && $rootScope.getAccountId() === $scope.gymId
            };

            var navigateToGymSuggestions = function () {
                $scope.navigateToGymSuggestions($scope.gymId);
            };

            var navigateToGymZones = function () {
                $scope.navigateToWalls($scope.gymId);
            };

            $scope.navigateToRoute = function(pGymId, pWallId, pRouteId) {
                $rootScope.navigateToRoute(pGymId, pWallId, pRouteId);
            }

            $scope.latestBoulderBlankState = {
                user: {
                    show: showForUser,
                    content: {
                        title: "This gym has no lead routes logged yet!",
                        text: "Ask this gym to update their setter profile",
                        link_text: "Leave Gym a Suggestion"
                    },
                    image: "images/placeholder--newestBouldering.jpg",
                    click: navigateToGymSuggestions
                },
                gym: {
                    show: showForGym,
                    content: {
                        title: "You have no routes!",
                        text: "Click below to start adding routes",
                        link_text: "Add Routes"
                    },
                    image: "images/placeholder--newestBouldering.jpg",
                    click: navigateToGymZones
                }
            };

            GymsService.getNewestBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.latestBoulder = pData;
                });
        }]);
