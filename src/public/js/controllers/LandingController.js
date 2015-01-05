/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('LandingController', [
        '$scope',
        'LoginService',
        function (
            $scope,
            LoginService
        ) {
            'use strict';
            angular.noop();
            $scope.test = 'a';
        }]);
