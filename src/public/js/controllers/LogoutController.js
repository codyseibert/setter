/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LogoutController', ['$scope', 'LoginService', '$location', function ($scope, LoginService, $location) {
        'use strict';

        LoginService.logout();
    }]);
