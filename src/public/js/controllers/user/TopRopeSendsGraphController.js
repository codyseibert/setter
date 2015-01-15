/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .controller('TopRopeSendsGraphController', [
        '$scope',
        '$routeParams',
        'UsersService',
        'BarGraphHelperService',
        function (
            $scope,
            $routeParams,
            UsersService,
            BarGraphHelperService
        ) {
            'use strict';

            $scope.options = {
                scaleFontColor: "#000",
                scaleFontSize: 20,
                animation: false
            };

            UsersService.getTopRopeSends($scope.userId)
                .success(function (pData) {
                    var data;
                    data = BarGraphHelperService.generateRouteCountGraphData(pData);
                    $scope.topropeSendsBarGraph = {
                        labels: data.labels,
                        data: data.data,
                        hasData: data.data[0].length > 0
                    };
                });
        }]);
