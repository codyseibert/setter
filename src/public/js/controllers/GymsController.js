/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('GymsController', ['$scope', 'GymsService', function ($scope, GymsService) {
        'use strict';

        $scope.gyms = [];

        GymsService.getGyms()
            .success(function (pData) {
                $scope.gyms = pData;
            });
    }]);
