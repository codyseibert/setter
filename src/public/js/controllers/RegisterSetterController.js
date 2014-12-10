/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterSetterController', ['$scope', 'SettersService', function ($scope, SettersService) {
        'use strict';

        $scope.form = {};

        $scope.registerClicked = function () {
            SettersService.registerSetter($scope.form)
                .success(function (pData, pStatus, pHeaders, pConfig) {
                    console.log('setter registered', pData);
                });
        };
    }]);
