/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .controller('LeadSendsGraphController', [
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
            $scope.userId = parseInt($routeParams.userId, 10);

            UsersService.getLeadSends($scope.userId)
                .success(function (pData) {
                    var data;
                    data = BarGraphHelperService.generateRouteCountGraphData(pData);
                    $scope.leadSendsBarGraph = {
                        labels: data.labels,
                        data: data.data,
                        hasData: data.data[0].length > 0
                    };
                });
        }]);
