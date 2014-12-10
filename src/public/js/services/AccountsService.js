/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
.factory('AccountsService', ['$http', function ($http) {
    'use strict';

    return {
        login: function () {
            return $http({
                method: "POST",
                url: "api/accounts/login"
            });
        }
    };
}]);
