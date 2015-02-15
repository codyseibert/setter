/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .controller('BoulderDistributionController', [
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

            GradesService.getBoulderGrades()
                .success(function (pGrades) {
                    $scope.boulderGrades = pGrades;

                    RoutesService.getBoulderRouteDistribution($scope.gymId, function (pData) {
                        var i,
                            j,
                            k,
                            count,
                            grade;

                        $scope.boulderRouteDistribution = pData;
                        $scope.boulderZoneKeys = [];
                        $scope.boulderZones = {};
                        $scope.boulderCounts = {};

                        // build up a lookup table for (zone, grade) -> count
                        for (i = 0; i < pData.length; i += 1) {
                            count = pData[i];
                            $scope.boulderZones[count.zone] = $scope.boulderZones[count.zone] || {};

                            for (j = 0; j < pGrades.length; j += 1) {
                                grade = pGrades[j];
                                $scope.boulderZones[count.zone][grade.name] = 0;
                            }
                        }

                        for (i = 0; i < pData.length; i += 1) {
                            count = pData[i];
                            $scope.boulderZones[count.zone][count.grade] = count.count;
                        }

                        // sort the keys using a natural sort algorithm
                        for (k in $scope.boulderZones) {
                            if ($scope.boulderZones.hasOwnProperty(k)) {
                                $scope.boulderZoneKeys.push(k);
                            }
                            $scope.boulderCounts[k] = [];
                        }
                        $scope.boulderZoneKeys.sort(naturalSort());

                        for (k in $scope.boulderZones) {
                            for (i = 0; i < $scope.boulderGrades.length; i += 1) {
                                var gradeName = $scope.boulderGrades[i].name
                                var gradeCount = $scope.boulderZones[k][gradeName]
                                $scope.boulderCounts[k].push(gradeCount)
                            }
                        }

                    });
                });

            $scope.export = function () {
                var JsPDF = jsPDF,
                    doc = new JsPDF(),
                    offsetX = 15,
                    offsetY = 15,
                    marginX = 13,
                    marginY = 9,
                    j,
                    i,
                    key,
                    counts,
                    k,
                    c,
                    count;

                doc.setFontSize(10);

                // Header
                doc.text(offsetX, offsetY, 'Zone');
                for (j = 0; j < $scope.boulderGrades.length; j += 1) {
                    doc.text(offsetX + marginX * (j + 1), offsetY, $scope.boulderGrades[j].name);
                }

                // Body
                for (i = 0; i < $scope.boulderZoneKeys.length; i += 1) {
                    if (i % 2 === 1) {
                        doc.setFillColor(225, 225, 225);
                        doc.rect(offsetX, offsetY + marginY * (i + 1) - 5, 1000, marginY, 'F');
                    }

                    key = $scope.boulderZoneKeys[i];
                    counts = $scope.boulderZones[key];
                    doc.text(offsetX, offsetY + marginY * (i + 1), key);
                    c = 0;
                    for (k in counts) {
                        if (counts.hasOwnProperty(k)) {
                            count = String(counts[k]);
                            doc.text(offsetX + marginX * (c + 1), offsetY + marginY * (i + 1), count);
                            c += 1;
                        }
                    }
                }
                doc.save('BoulderDistributionGraph.pdf');
            };
        }]);
