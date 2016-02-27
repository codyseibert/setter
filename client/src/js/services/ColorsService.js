/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('ColorsService', ['$http', function ($http) {
        'use strict';

        return {
            getColors: function () {
                return $http({
                    method: 'GET',
                    url: 'api/colors'
                });
            }
        };
    }]);
