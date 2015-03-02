/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('BestLeadController', [
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
                return $scope.bestLead !== undefined &&
                    $scope.bestLead.length === 0 &&
                    $rootScope.getAccountId() !== $scope.gymId;
            };

            var showForGym = function () {
                return $scope.bestLead !== undefined &&
                    $scope.bestLead.length === 0 &&
                    $rootScope.getAccountId() === $scope.gymId;
            };

            var navigateToGymSuggestions = function () {
                $scope.navigateToGymSuggestions($scope.gymId);
            };

            var navigateToGymZones = function () {
                $scope.navigateToWalls($scope.gymId);
            };

            $scope.navigateToRoute = function(pGymId, pWallId, pRouteId) {
                $rootScope.navigateToRoute(pGymId, pWallId, pRouteId);
            };

            $scope.bestLeadBlankState = {
                user: {
                    show: showForUser,
                    content: {
                        title: "Oops! These aren't the best routes at your gym.",
                        text: "Climbers at your gym haven't rated any yet. Let them know you are on Setter and start getting feedback!",
                        link_text: null
                    },
                    image: "images/placeholder--bestLead.jpg",
                    click: navigateToGymSuggestions
                },
                gym: {
                    show: showForGym,
                    content: {
                        title: "Oops! These aren't the best routes at your gym.",
                        text: "Climbers at your gym haven't rated any yet. Let them know you are on Setter and start getting feedback!",
                        link_text: null
                    },
                    image: "images/placeholder--bestLead.jpg",
                    click: navigateToGymZones
                }
            };

            GymsService.getBestRatedLead($scope.gymId)
                .success(function (pData) {
                    $scope.bestLead = pData;
                });
        }]);
