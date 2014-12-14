/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, alert: false */

angular.module('SETTER')
    .controller('CreateRouteController', [
        '$scope',
        '$routeParams',
        'GradesService',
        'RoutesService',
        'ColorsService',
        'SettersService',
        function ($scope,
            $routeParams,
            GradesService,
            RoutesService,
            ColorsService,
            SettersService) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;
            $scope.setId = $routeParams.setId;

            $scope.form = {};
            $scope.setters = [];

            $scope.addClicked = function () {
                var name = $scope.form.name,
                    boulderGradeId = $scope.form.boulderGrade.id,
                    ropeGradeId = $scope.form.ropeGrade.id,
                    colorId = $scope.form.color,
                    setterId = $scope.form.setter.id,
                    note = $scope.form.note;

                RoutesService.createRoute($scope.setId, name, colorId, boulderGradeId, ropeGradeId, setterId, note)
                    .success(function (pData) {
                        $scope.form.boulderGrade = $scope.boulderGrades[0];
                        $scope.form.ropeGrade = $scope.ropeGrades[0];
                        $scope.form.color = $scope.colors[0].id;
                        $scope.form.setter = $scope.setters[0];
                        $scope.form.note = "";
                        $scope.form.name = "";
                        alert("route added!");
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

            GradesService.getBoulderGrades()
                .success(function (pData) {
                    pData.unshift({
                        id: -1,
                        name: "V?"
                    });
                    $scope.boulderGrades = pData;
                    $scope.form.boulderGrade = pData[0];
                });

            GradesService.getRopeGrades()
                .success(function (pData) {
                    pData.unshift({
                        id: -1,
                        name: "5.?"
                    });
                    $scope.ropeGrades = pData;
                    $scope.form.ropeGrade = pData[0];
                });

            ColorsService.getColors()
                .success(function (pData) {
                    $scope.colors = pData;
                    $scope.form.color = pData[0].id;
                    $scope.colorChanged();
                });

            SettersService.getSettersAtGym($scope.gymId)
                .success(function (pData) {
                    $scope.setters = pData;
                    $scope.form.setter = pData[0];
                });
        }]);
