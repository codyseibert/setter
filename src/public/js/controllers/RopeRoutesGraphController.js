/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('RopeRoutesGraphController', [
        '$scope',
        '$routeParams',
        'RoutesService',
        'BarGraphHelperService',
        function (
            $scope,
            $routeParams,
            RoutesService,
            BarGraphHelperService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);

            $scope.chartOptions = {
                scaleFontColor: "#000",
                scaleFontSize: 20,
                animation: false
            };

            RoutesService.getCurrentRopeRoutes($scope.gymId, function (pData) {
                $scope.graph = BarGraphHelperService.generateRouteCountGraphData(pData);
            });

            $scope.export = function () {
                var canvas,
                    image,
                    doc;

                canvas = $('#ropeGraph').get(0);
                image = new Image();
                image.src = canvas.toDataURL("image/png");
                doc = new jsPDF();
                doc.text(20, 20, 'Current Rope Routes');
                doc.addImage(image, 15, 40, 180, 160);
                doc.save();
            };
        }]);
