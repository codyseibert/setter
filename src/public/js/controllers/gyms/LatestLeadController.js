/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('LatestLeadController', [
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
                return $scope.latestLead !== undefined &&
                    $scope.latestLead.length === 0 &&
                    $rootScope.getAccountId() !== $scope.gymId;
            };

            var showForGym = function () {
                return $scope.latestLead !== undefined &&
                    $scope.latestLead.length === 0 &&
                    $rootScope.getAccountId() === $scope.gymId;
            };

            var navigateToGymSuggestions = function () {
                $rootScope.navigateToGymSuggestions($scope.gymId);
            };

            var navigateToGymZones = function () {
                $rootScope.navigateToWalls($scope.gymId);
            };

            $scope.navigateToRoute = function(pGymId, pWallId, pRouteId) {
                $rootScope.navigateToRoute(pGymId, pWallId, pRouteId);
            };

            $scope.latestLeadBlankState = {
                user: {
                    show: showForUser,
                    content: {
                        title: "Bummer, this gym has no routes yet.",
                        text: "If you'd like to climb some, let them know over at their",
                        link_text: " Suggestions board."
                    },
                    image: "images/placeholder--newestBouldering.jpg",
                    click: navigateToGymSuggestions
                },
                gym: {
                    show: showForGym,
                    content: {
                        title: "Oops! These aren't your newest lead routes.",
                        text: "There aren't any here right now, but you can set new ones on the",
                        link_text: " Manage Zones page"
                    },
                    image: "images/placeholder--newestBouldering.jpg",
                    click: navigateToGymZones
                }
            };

            GymsService.getNewestLead($scope.gymId)
                .success(function (pData) {
                    $scope.latestLead = pData;
                });
        }]);
