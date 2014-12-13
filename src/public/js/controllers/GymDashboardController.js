/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('GymDashboardController', ['$scope', 'LoginService', function ($scope, LoginService) {
        'use strict';

        if (!LoginService.validateLoggedIn()) {
            return;
        }

        $scope.gymId = LoginService.getAccountId();

    }]);
