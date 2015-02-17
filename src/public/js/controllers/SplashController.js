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


        $scope.GYM_REGISTRATION = 'gymRegistration';
        $scope.USER_REGISTRATION = 'userRegistration'; 
        $scope.currentRegistrationTab = $scope.GYM_REGISTRATION; 

        $scope.panel = $scope.GYM_REGISTRATION; 

        $scope.setCurrentTab = function (pCurrentTab) {
            $scope.currentRegistrationTab = pCurrentTab;
        };

    }]);
