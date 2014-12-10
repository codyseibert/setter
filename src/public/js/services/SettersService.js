/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SettersService', ['$http', function ($http) {
        'use strict';

        return {
            registerSetter: function (pRegistrationInfo) {
                return $http({
                    method: "POST",
                    url: "api/register/setter",
                    data: pRegistrationInfo
                });
            }
        };
    }]);
