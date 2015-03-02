/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, $: false */

angular.module('SETTER')
    .controller('BoulderRoutesGraphController', [
        '$scope',
        '$rootScope',
        '$routeParams',
        'RoutesService',
        'BarGraphHelperService',
        function (
            $scope,
            $rootScope,
            $routeParams,
            RoutesService,
            BarGraphHelperService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.hasBoulder = undefined;
            $scope.getAccountId = function () {
                return $rootScope.getAccountId();
            }


            var showForUser = function () {
                return $scope.hasBoulder !== undefined &&
                    $scope.hasBoulder === false &&
                    $rootScope.getAccountId() !== $scope.gymId;
            };

            var showForGym = function () {
                return $scope.hasBoulder !== undefined &&
                    $scope.hasBoulder === false &&
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

            $scope.boulderRoutesBlankState = {
                user: {
                    show: showForUser,
                    content: {
                        title: "This gym has no bouldering routes, yet.",
                        text: "If you'd like to climb some, let them know over at their",
                        link_text: "Suggestions Board"
                    },
                    image: "images/placeholder--BoulderingGraph.jpg",
                    click: navigateToGymSuggestions
                },
                gym: {
                    show: showForGym,
                    content: {
                        title: "Oops! There are no problems at your gym yet.",
                        text: "Start setting some at the",
                        link_text: "Manage Zones Page"
                    },
                    image: "images/placeholder--BoulderingGraph.jpg",
                    click: navigateToGymZones
                }
            };

            RoutesService.getCurrentBoulderRoutes($scope.gymId, function (pData) {
                $scope.hasBoulder = pData.length > 0;
                $scope.graph = BarGraphHelperService.generateRouteCountGraphData(pData);
            });

            $scope.export = function () {
                var canvas,
                    image,
                    doc,
                    JsPDF = jsPDF;

                canvas = $('#boulderGraph').get(0);
                image = new Image();
                image.src = canvas.toDataURL("image/png");
                doc = new JsPDF();
                doc.text(20, 20, 'Current Bouldering Routes');
                doc.addImage(image, 15, 40, 180, 160);
                doc.save('BoulderRoutesGraph.pdf');
            };

        }]);
