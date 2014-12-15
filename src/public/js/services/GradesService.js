/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('GradesService', ['$http', function ($http) {
        'use strict';

        return {
            getBoulderGrades: function () {
                return $http({
                    method: 'GET',
                    url: 'api/grades/boulder'
                });
            },
            getRopeGrades: function () {
                return $http({
                    method: 'GET',
                    url: 'api/grades/rope'
                });
            }
        };
    }]);
