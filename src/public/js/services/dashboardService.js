angular.module('setter')
.factory('Insights', function ($http) {
    'use strict';
 
    var ret = {};

    ret.boulderingPerformanceHTTP = $http({
        method: 'GET', 
        url: 'api/gyms/1/insights/performance/bouldering'
    }); 

    ret.leadPerformanceHTTP = $http({
        method: 'GET', 
        url: 'api/gyms/1/insights/performance/lead'
    }); 

    ret.topRopePerformanceHTTP = $http({
        method: 'GET', 
        url: 'api/gyms/1/insights/performance/toprope'
    }); 

    ret.topBoulderingCountHTTP = $http({
        method: 'GET', 
        url: 'api/gyms/1/insights/count/bouldering'
    });  

    return ret;
});
