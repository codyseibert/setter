angular.module('setter')
.controller('gymDashboardCtrl', function DashboardController($scope, Insights, $timeout) {
	'use strict';
   
    $scope.bouldering_performance = [];
    $scope.lead_performance = [];
    $scope.toprope_performance = [];
    $scope.bouldering_count = [];

    $scope.getArray = function(count){
        return new Array(count);
    }

    Insights.boulderingPerformanceHTTP
        .success(function(data, status, headers, config){
            $scope.bouldering_performance = data; 
        });

    Insights.leadPerformanceHTTP
        .success(function(data, status, headers, config){
            $scope.lead_performance = data; 
        });

    Insights.topRopePerformanceHTTP
        .success(function(data, status, headers, config){
            $scope.toprope_performance = data; 
        }); 

    Insights.topBoulderingCountHTTP
        .success(function(data, status, headers, config){
            $scope.bouldering_count = data;  
        }); 
});
