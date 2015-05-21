/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .controller('BoulderSendsGraphController', [
        '$scope',
        '$routeParams',
        '$timeout',
        'UsersService',
        'BarGraphHelperService',
        function (
            $scope,
            $routeParams,
            $timeout,
            UsersService,
            BarGraphHelperService
        ) {
            'use strict';
            $scope.userId = parseInt($routeParams.userId, 10);

            UsersService.getBoulderSends($scope.userId)
                .success(function (pData) {
                  console.log(pData);
                    var data;
                    data = BarGraphHelperService.generateRouteCountGraphData(pData);

                    $scope.boulderSendsBarGraph = {
                        labels: data.labels,
                        data: data.data,
                        hasData: data.data[0].length > 0
                    };


            });


            $scope.graphHasData = function() {
               if($scope.boulderSendsBarGraph.hasData) {
                return true
              } else if (!$scope.boulderSendsBarGraph.hasData) {
                return false;
              }
            };


}]);
