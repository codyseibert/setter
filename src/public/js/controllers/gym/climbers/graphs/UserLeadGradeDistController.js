/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('UserLeadGradeDistController', [
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

            var showForUser = function () {
                return $scope.bestBoulder !== undefined &&
                    $scope.bestBoulder.length === 0 &&
                    $rootScope.getAccountId() !== $scope.gymId;
            };

            var showForGym = function () {
                return $scope.bestBoulder !== undefined &&
                    $scope.bestBoulder.length === 0 &&
                    $rootScope.getAccountId() === $scope.gymId;
            };

            var navigateToGymSuggestions = function () {
                $scope.navigateToGymSuggestions($scope.gymId);
            };

            var navigateToGymZones = function () {
                $scope.navigateToWalls($scope.gymId);
            };

            $scope.openRouteModal = $rootScope.openRouteModal;

            $scope.bestBoulderBlankState = {
                user: {
                    show: showForUser,
                    content: {
                        title: "Oh no! There are no rated routes available yet.",
                        text: "Either this gym hasn't set any routes or climbers haven't rated them.",
                        link_text: null
                    },
                    image: "images/placeholder--bestBouldering.jpg",
                    click: navigateToGymSuggestions
                },
                gym: {
                    show: showForGym,
                    content: {
                        title: "Oops! These aren't the best problems at your gym.",
                        text: "Climbers at your gym haven't rated any yet. Let them know you are on Setter and start getting feedback!",
                        link_text: null
                    },
                    image: "images/placeholder--bestBouldering.jpg",
                    click: navigateToGymZones
                }
            };

            GymsService.getBestRatedBoulder($scope.gymId)
                .success(function (pData) {
                    $scope.bestBoulder = pData;
                });
        }]);
