/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('BestBoulderController', [
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

            $scope.routeSelected = false;
            $scope.$watch(function() {

                return SelectedRouteService.offCanvasModalShown;

            }, function(newValue, oldValue) {
                console.log(newValue, oldValue);
                $scope.offCanvasModalShown = newValue; 

            });


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

            $scope.navigateToRoute = function(pGymId, pWallId, pRouteId) {
                $rootScope.navigateToRoute(pGymId, pWallId, pRouteId);
            };


            /* 

                Functions to hide/toggle modal on page
            */
            $scope.selectRoute = function(route) {
                $scope.routeSelected = route;
                SelectedRouteService.setSelectedRoute(route);
                SelectedRouteService.offCanvasModalShown = true; 
                console.log($scope.routeSelected);
            };

            $scope.closeRoute = function () {
                console.log('hey');
                SelectedRouteService.hideModal(); 
            };

            $scope.isRouteSelected = function() {
                return $scope.routeSelected;
            };


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
