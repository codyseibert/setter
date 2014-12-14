/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false */

angular.module('SETTER')
    .controller('AddSettersController', ['$scope', 'SettersService', function ($scope, SettersService) {
        'use strict';

        SettersService.getSetters()
            .success(function (pData) {
                $scope.setters = pData;
            });

        $scope.addSetterClicked = function (setter) {
            SettersService.createSetterGymAccess(setter.id)
                .success(function () {
                    setter.hide = true;
                    alert(setter.firstname + " " + setter.lastname + " added to your gym's setter list");
                });
        };
    }]);
