/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, alert: false, confirm: false */

angular.module('SETTER')
    .controller('CreateRouteController', [
        '$scope',
        '$routeParams',
        'GradesService',
        'RoutesService',
        'ColorsService',
        'SettersService',
        'isEditMode',
        '$q',
        'LoginService',
        function ($scope,
            $routeParams,
            GradesService,
            RoutesService,
            ColorsService,
            SettersService,
            isEditMode,
            $q,
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
                findEntry;

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;
            $scope.routeId = $routeParams.routeId;

            $scope.isEditMode = isEditMode;

            $scope.form = {};
            $scope.setters = [];

            $scope.addClicked = function () {
                var name = $scope.form.name,
                    boulderGradeId = $scope.form.boulderGrade.id,
                    ropeGradeId = $scope.form.ropeGrade.id,
                    colorId = $scope.form.color,
                    setterId = $scope.form.setter.account_id,
                    note = $scope.form.note;

                RoutesService.createRoute($scope.wallId, name, colorId, boulderGradeId, ropeGradeId, setterId, note)
                    .success(function (pData) {
                        $scope.form.boulderGrade = $scope.boulderGrades[0];
                        $scope.form.ropeGrade = $scope.ropeGrades[0];
                        $scope.form.color = $scope.colors[0].id;
                        $scope.form.setter = $scope.setters[0];
                        $scope.form.note = "";
                        $scope.form.name = "";
                        $scope.navigateToWall($scope.gymId, $scope.wallId);
                    });
            };

            $scope.saveClicked = function () {
                var name = $scope.form.name,
                    boulderGradeId = $scope.form.boulderGrade.id,
                    ropeGradeId = $scope.form.ropeGrade.id,
                    colorId = $scope.form.color,
                    setterId = $scope.form.setter.account_id,
                    note = $scope.form.note;

                RoutesService.updateRoute($scope.routeId, name, colorId, boulderGradeId, ropeGradeId, setterId, note)
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
                    $scope.form.ropeGrade = pData[0];
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

            $q.all([getBoulderGradesPromise,
                getRopeGradesPromise,
                getColorsPromise,
                getSettersPromise])
                .then(function () {
                    if (!$scope.routeId) {
                        return;
                    }

                    RoutesService.getRoute($scope.routeId)
                        .success(function (pData) {
                            console.log(pData);
                            $scope.form.boulderGrade = findEntry(pData.boulder_grade_id, $scope.boulderGrades);
                            $scope.form.ropeGrade = findEntry(pData.rope_grade_id, $scope.ropeGrades);
                            $scope.form.color = findEntry(pData.color_id, $scope.colors).id;
                            $scope.form.setter = findEntry(pData.setter_id, $scope.setters);
                            $scope.form.note = pData.note;
                            $scope.form.name = pData.route_name;
                            $scope.colorChanged();
                        });
                });

        }]);
