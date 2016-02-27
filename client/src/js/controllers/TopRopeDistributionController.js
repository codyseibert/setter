/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, $: false, naturalSort: false, jsPDF: false */

angular.module('SETTER')
    .controller('TopRopeDistributionController', [
        '$scope',
        '$rootScope',
        '$routeParams',
        'RoutesService',
        'GradesService',
        function (
            $scope,
            $rootScope,
            $routeParams,
            RoutesService,
            GradesService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.hasTopRope = false;
            $scope.getAccountId = function () {
                return $rootScope.getAccountId();
            }

            GradesService.getRopeGrades()
                .success(function (pGrades) {
                    $scope.ropeGrades = pGrades;

                    RoutesService.getTopRopeRouteDistribution($scope.gymId, function (pData) {
                        var i,
                            j,
                            k,
                            count,
                            grade,
                            gradeName,
                            gradeCount;
                        $scope.ropeRouteDistribution = pData;
                        $scope.ropeZoneKeys = [];
                        $scope.ropeZones = {};
                        $scope.ropeCounts = {};

                        $scope.hasTopRope = pData.length > 0;

                        // build up a lookup table for (zone, grade) -> count
                        for (i = 0; i < pData.length; i += 1) {
                            count = pData[i];
                            $scope.ropeZones[count.zone] = $scope.ropeZones[count.zone] || {};

                            for (j = 0; j < pGrades.length; j += 1) {
                                grade = pGrades[j];
                                $scope.ropeZones[count.zone][grade.name] = 0;
                            }
                        }

                        for (i = 0; i < pData.length; i += 1) {
                            count = pData[i];
                            $scope.ropeZones[count.zone][count.grade] = count.count;
                        }

                        // sort the keys using a natural sort algorithm
                        for (k in $scope.ropeZones) {
                            if ($scope.ropeZones.hasOwnProperty(k)) {
                                $scope.ropeZoneKeys.push(k);
                                $scope.ropeCounts[k] = [];
                            }
                        }
                        $scope.ropeZoneKeys.sort(naturalSort());

                        for (k in $scope.ropeZones) {
                            if ($scope.ropeZones.hasOwnProperty(k)) {
                                for (i = 0; i < $scope.ropeGrades.length; i += 1) {
                                    gradeName = $scope.ropeGrades[i].name;
                                    gradeCount = $scope.ropeZones[k][gradeName];
                                    $scope.ropeCounts[k].push(gradeCount);
                                }
                            }
                        }
                    });
                });

            // TODO: Refactor
            $scope.export = function () {
                var JsPDF = jsPDF,
                    doc = new JsPDF(),
                    offsetX = 15,
                    offsetY = 15,
                    marginX = 13,
                    marginY = 9,
                    j,
                    i,
                    k,
                    key,
                    counts,
                    count,
                    c;

                doc.setFontSize(10);

                // Header
                doc.text(offsetX, offsetY, 'Zone');
                for (j = 0; j < $scope.ropeGrades.length; j += 1) {
                    doc.text(offsetX + marginX * (j + 1), offsetY, $scope.ropeGrades[j].name);
                }

                // Body
                for (i = 0; i < $scope.ropeZoneKeys.length; i += 1) {
                    if (i % 2 === 1) {
                        doc.setFillColor(225, 225, 225);
                        doc.rect(offsetX, offsetY + marginY * (i + 1) - 5, 1000, marginY, 'F');
                    }

                    key = $scope.ropeZoneKeys[i];
                    counts = $scope.ropeZones[key];
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
                doc.save('RopeDistributionGraph.pdf');
            };

        }]);
