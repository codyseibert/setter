/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('UserDashboardController', ['LoginService', function (LoginService) {
        'use strict';

        if (!LoginService.validateLoggedIn()) {
            return;
        }

    }]);
