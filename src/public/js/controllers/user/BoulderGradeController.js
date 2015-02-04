/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .controller('BoulderGradeController', [
        '$scope',
        'UsersService',
        function (
            $scope,
            UsersService
        ) {
            'use strict';

            UsersService.getBoulderSends($scope.userId)
                .success(function (pData) {
                    var dataCopy,
                        sum,
                        i,
                        max,
                        average;

                    if (pData.length === 0) {
                        $scope.boulderGrade = null;
                        return;
                    }

                    dataCopy = pData.slice(0);
                    dataCopy.sort(function (a, b) {
                        return b.value - a.value;
                    });

                    max = dataCopy.slice(0, 10);
                    sum = 0;
                    for (i = 0; i < max.length; i += 1) {
                        sum += dataCopy[i].value;
                    }

                    average = sum / max.length;
                    average = parseFloat(average).toFixed(0);
                    $scope.boulderGrade = 'V' + average;
                });
        }]);
