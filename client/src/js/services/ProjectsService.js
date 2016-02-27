/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('ProjectsService', ['$http', function ($http) {
        'use strict';

        return {
            getProjectsForRoute: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId + '/projects'
                });
            },
            isProject: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId + '/isProject'
                });
            },
            createProject: function (pRouteId) {
                return $http({
                    method: 'POST',
                    url: 'api/routes/' + pRouteId + '/projects'
                });
            },
            deleteProject: function (pRouteId) {
                return $http({
                    method: 'DELETE',
                    url: 'api/routes/' + pRouteId + '/projects'
                });
            }
        };
    }]);
