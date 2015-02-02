/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, alert: false, confirm: false */

angular.module('SETTER')
    .controller('CreateRouteController', [
        '$scope',
        '$routeParams',
        '$q',
        'GradesService',
        'RoutesService',
        'ColorsService',
        'SettersService',
        'isEditMode',
        'LoginService',
        function (
            $scope,
            $routeParams,
            $q,
            GradesService,
            RoutesService,
            ColorsService,
            SettersService,
            isEditMode,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            var getBoulderGradesPromise,
                getRopeGradesPromise,
                getColorsPromise,
                getSettersPromise,
                findEntry,
                BOULDER_TYPE = 0,
                TOPROPE_TYPE = 1,
                LEAD_TYPE = 2;

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;
            $scope.routeId = $routeParams.routeId;

            $scope.isEditMode = isEditMode;

            $scope.form = {};
            $scope.setters = [];

            $scope.types = [
                {
                    id: BOULDER_TYPE,
                    name: 'Boulder'
                },
                {
                    id: TOPROPE_TYPE,
                    name: 'Top Rope'
                },
                {
                    id: LEAD_TYPE,
                    name: 'Lead'
                }
            ];
            $scope.form.type = $scope.types[BOULDER_TYPE];

            var cleanGrades = function () {
                if ($scope.form.type.name === 'Boulder') {
                    $scope.form.topRopeGrade = $scope.ropeGrades[0];
                    $scope.form.leadGrade = $scope.ropeGrades[0];
                } else if ($scope.form.type.name === 'Top Rope') {
                    $scope.form.boulderGrade = $scope.boulderGrades[0];
                    $scope.form.leadGrade = $scope.ropeGrades[0];
                } else if ($scope.form.type.name === 'Lead') {
                    $scope.form.boulderGrade = $scope.boulderGrades[0];
                    $scope.form.topRopeGrade = $scope.ropeGrades[0];
                }
            };

            $scope.addClicked = function () {
                cleanGrades();

                var name = $scope.form.name,
                    type = $scope.form.type.id,
                    boulderGradeId = $scope.form.boulderGrade.id,
                    topRopeGradeId = $scope.form.topRopeGrade.id,
                    leadGradeId = $scope.form.leadGrade.id,
                    colorId = $scope.form.color,
                    setterId = $scope.form.setter.account_id,
                    note = $scope.form.note;

                RoutesService.createRoute(
                    $scope.gymId,
                    $scope.wallId,
                    name,
                    colorId,
                    type,
                    boulderGradeId,
                    topRopeGradeId,
                    leadGradeId,
                    setterId,
                    note
                )
                    .success(function (pData) {
                        $scope.form.boulderGrade = $scope.boulderGrades[0];
                        $scope.form.topRopeGrade = $scope.ropeGrades[0];
                        $scope.form.leadGrade = $scope.ropeGrades[0];
                        $scope.form.color = $scope.colors[0].id;
                        $scope.form.setter = $scope.setters[0];
                        $scope.form.note = "";
                        $scope.form.name = "";
                        $scope.navigateToWall($scope.gymId, $scope.wallId);
                    });
            };

            $scope.saveClicked = function () {
                cleanGrades();

                var name = $scope.form.name,
                    type = $scope.form.type.id,
                    boulderGradeId = $scope.form.boulderGrade.id,
                    topRopeGradeId = $scope.form.topRopeGrade.id,
                    leadGradeId = $scope.form.leadGrade.id,
                    colorId = $scope.form.color,
                    setterId = $scope.form.setter.account_id,
                    note = $scope.form.note;

                RoutesService.updateRoute(
                    $scope.gymId,
                    $scope.wallId,
                    $scope.routeId,
                    name,
                    colorId,
                    type,
                    boulderGradeId,
                    topRopeGradeId,
                    leadGradeId,
                    setterId,
                    note
                )
                    .success(function (pData) {
                        $scope.navigateToRoute($scope.gymId, $scope.wallId, $scope.routeId);
                    });
            };

            $scope.hasSetters = function () {
                return $scope.setters.length > 0;
            };

            $scope.colorChanged = function () {
                var i;
                for (i = 0; i < $scope.colors.length; i += 1) {
                    if ($scope.colors[i].id === parseInt($scope.form.color, 10)) {
                        $scope.text_color = $scope.colors[i].value;
                        break;
                    }
                }
            };

            getBoulderGradesPromise = GradesService.getBoulderGrades()
                .success(function (pData) {
                    pData.unshift({
                        id: -1,
                        name: "V?"
                    });
                    $scope.boulderGrades = pData;
                    $scope.form.boulderGrade = pData[0];
                });

            getRopeGradesPromise = GradesService.getRopeGrades()
                .success(function (pData) {
                    pData.unshift({
                        id: -1,
                        name: "5.?"
                    });
                    $scope.ropeGrades = pData;
                    $scope.form.topRopeGrade = pData[0];
                    $scope.form.leadGrade = pData[0];
                });

            getColorsPromise = ColorsService.getColors()
                .success(function (pData) {
                    $scope.colors = pData;
                    $scope.form.color = pData[0].id;
                    $scope.colorChanged();
                });

            getSettersPromise = SettersService.getSettersAtGym($scope.gymId)
                .success(function (pData) {
                    $scope.setters = pData;
                    $scope.form.setter = pData[0];
                });

            findEntry = function (pLookingFor, pArray) {
                var i,
                    entry;
                for (i = 0; i < pArray.length; i += 1) {
                    entry = pArray[i];

                    if (entry.id === pLookingFor || entry.account_id === pLookingFor) {
                        return entry;
                    }
                }
                return pArray[0];
            };

            $q.all([
                getBoulderGradesPromise,
                getRopeGradesPromise,
                getColorsPromise,
                getSettersPromise
            ])
                .then(function () {
                    if (!$scope.routeId) {
                        return;
                    }

                    RoutesService.getRoute($scope.routeId)
                        .success(function (pData) {
                            $scope.form.type = findEntry(pData.type, $scope.types);
                            $scope.form.boulderGrade = findEntry(pData.boulder_grade_id, $scope.boulderGrades);
                            $scope.form.topRopeGrade = findEntry(pData.toprope_grade_id, $scope.ropeGrades);
                            $scope.form.leadGrade = findEntry(pData.lead_grade_id, $scope.ropeGrades);
                            $scope.form.color = findEntry(pData.color_id, $scope.colors).id;
                            $scope.form.setter = findEntry(pData.setter_id, $scope.setters);
                            $scope.form.note = pData.note;
                            $scope.form.name = pData.route_name;
                            $scope.colorChanged();
                        });
                });

        }]);
