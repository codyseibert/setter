/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterController', ['$scope', '$location', function RegisterController($scope, $location) {
        'use strict';

        $scope.navigateToUserRegistration = function () {
            $location.path('register/user');
        };

        $scope.navigateToSetterRegistration = function () {
            $location.path('register/setter');
        };

        $scope.navigateToGymRegistration = function () {
            $location.path('register/gym');
        };
    }]);
