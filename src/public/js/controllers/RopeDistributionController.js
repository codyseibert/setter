/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false */

angular.module('SETTER')
    .controller('RopeDistributionController', [
        '$scope',
        '$routeParams',
        'RoutesService',
        'GradesService',
        function (
            $scope,
            $routeParams,
            RoutesService,
            GradesService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);

            GradesService.getRopeGrades()
                .success(function (pGrades){
                    $scope.ropeGrades = pGrades;

                    RoutesService.getRopeRouteDistribution($scope.gymId, function (pData) {
                        var i,
                            j,
                            k;

                        $scope.ropeRouteDistribution = pData;
                        $scope.ropeZoneKeys = [];
                        $scope.ropeZones = {};

                        // build up a lookup table for (zone, grade) -> count
                        for (i = 0; i < pData.length; i += 1) {
                            var count = pData[i];
                            $scope.ropeZones[count.zone] = $scope.ropeZones[count.zone] || {};

                            for (j = 0; j < pGrades.length; j += 1) {
                                var grade = pGrades[j];
                                $scope.ropeZones[count.zone][grade.name] = 0;
                            }
                        }

                        for (i = 0; i < pData.length; i += 1) {
                            var count = pData[i];
                            $scope.ropeZones[count.zone][count.grade] = count.count;
                        }

                        // sort the keys using a natural sort algorithm
                        for (k in $scope.ropeZones) {
                            if ($scope.ropeZones.hasOwnProperty(k)){
                                $scope.ropeZoneKeys.push(k);
                            }
                        }

                        $scope.ropeZoneKeys.sort(naturalSort());
                    });
                });

            $scope.export = function () {
                var doc;
                doc = new jsPDF();
                doc.setFontSize(10);
                var offsetX = 15;
                var offsetY = 15;
                var marginX = 13;
                var marginY = 9;

                // Header
                doc.text(offsetX, offsetY, 'Zone');
                for (var j = 0; j < $scope.ropeGrades.length; j += 1) {
                    doc.text(offsetX + marginX * (j + 1), offsetY, $scope.ropeGrades[j].name);
                }

                // Body
                for (var i = 0; i < $scope.ropeZoneKeys.length; i += 1) {
                    if (i % 2 === 1) {
                        doc.setFillColor(225, 225, 225);
                        doc.rect(offsetX, offsetY + marginY * (i + 1) - 5, 1000, marginY, 'F');
                    }

                    var key = $scope.ropeZoneKeys[i];
                    var counts = $scope.ropeZones[key];
                    doc.text(offsetX, offsetY + marginY * (i + 1), key);
                    var c = 0;
                    for (var k in counts) {
                        var count = counts[k];
                        doc.text(offsetX + marginX * (c + 1), offsetY + marginY * (i + 1), count + '');
                        c += 1;
                    };
                }
                doc.save();
            };

        }]);
