/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, $: false, jsPDF: false, confirm: false */

angular.module('SETTER')
    .controller('LeadRoutesGraphController', [
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

            RoutesService.getCurrentLeadRoutes($scope.gymId, function (pData) {
                $scope.graph = BarGraphHelperService.generateRouteCountGraphData(pData);
            });

            $scope.export = function () {
                var canvas,
                    image,
                    doc,
                    JsPDF = jsPDF;

                canvas = $('#leadGraph').get(0);
                image = new Image();
                image.src = canvas.toDataURL("image/png");
                doc = new JsPDF();
                doc.text(20, 20, 'Current Lead Routes');
                doc.addImage(image, 15, 40, 180, 160);
                doc.save('LeadRoutesGraph.pdf');
            };
        }]);
