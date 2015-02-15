/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
  .controller('SplashController', [
    '$scope',
    '$sce',
    'BlogService',
    'DateFormatService',
    'LoginService',
    function SplashController(
        $scope,
        $sce,
        BlogService,
        DateFormatService,
        LoginService
    ) {
    'use strict';

        if (LoginService.isLoggedIn()) {
            LoginService.logout();
        }

    }]);
