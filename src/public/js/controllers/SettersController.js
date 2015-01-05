/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false */

angular.module('SETTER')
    .controller('SettersController', [
        '$scope',
        'SettersService',
        'LoginService',
        function (
            $scope, 
            SettersService,
            LoginService
        ) {
        'use strict';

        if (!LoginService.validateLoggedIn()) {
            return;
        }

        SettersService.getSettersAtGym(LoginService.getAccountId())
            .success(function (pData) {
                $scope.setters = pData;
            });

        SettersService.getUsers()
            .success(function (pData) {
                $scope.users = pData;
            });

        $scope.addSetterClicked = function (pSetter) {
            SettersService.createSetterGymAccess(pSetter.account_id)
                .success(function () {
                    var index = $scope.users.indexOf(pSetter);
                    $scope.users.splice(index, 1);
                    $scope.setters.push(pSetter);
                    alert(pSetter.firstname + " " + pSetter.lastname + " added to your gym's setter list");
                });
        };

        $scope.removeSetterClicked = function (pSetter) {
            SettersService.removeSetterGymAccess(pSetter.account_id)
                .success(function () {
                    var index = $scope.setters.indexOf(pSetter);
                    $scope.setters.splice(index, 1);
                    $scope.users.push(pSetter);
                    alert(pSetter.firstname + " " + pSetter.lastname + " removed to your gym's setter list");
                });
        };
    }]);
