/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false */

angular.module('SETTER')
    .controller('AddSetterController', [
        '$scope',
        '$routeParams',
        'SettersService',
        'LoginService',
        function (
            $scope,
            $routeParams,
            SettersService,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.form = {
                filter: ''
            };

            $scope.gymId = $routeParams.gymId;

            SettersService.getUsers()
                .success(function (pData) {
                    pData.map(function (pEntry) {
                        pEntry.name = pEntry.firstname + ' ' + pEntry.lastname;
                        return pEntry;
                    });
                    $scope.users = pData;
                });

            $scope.addSetterClicked = function (pSetter) {
                SettersService.createSetterGymAccess($scope.gymId, pSetter.account_id)
                    .success(function () {
                        var index = $scope.users.indexOf(pSetter);
                        $scope.users.splice(index, 1);
                        alert(pSetter.firstname + " " + pSetter.lastname + " added to your gym's setter list");
                    });
            };

            $scope.applyFilter = function () {
                var filter = $scope.form.filter.toUpperCase();
                $scope.users.map(function (pEntry) {
                    if (pEntry.name.toUpperCase().indexOf(filter) !== -1) {
                        pEntry.hide = false;
                    } else {
                        pEntry.hide = true;
                    }
                    return pEntry;
                });
            };
        }]);
