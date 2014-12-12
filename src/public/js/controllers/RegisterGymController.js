/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('RegisterGymController', ['$scope', 'GymsService', function ($scope, GymsService) {
        'use strict';

        $scope.form = {};

        $scope.registerClicked = function () {
            GymsService.registerGym($scope.form)
                .success(function (pData, pStatus, pHeaders, pConfig) {
                    console.log('gym registered', pData);
                });
        };
    }]);
