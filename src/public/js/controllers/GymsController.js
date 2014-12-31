/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('GymsController', ['$scope', 'GymsService', function ($scope, GymsService) {
        'use strict';

        $scope.gyms = [];
        $scope.form = {
            search: ''
        };

        GymsService.getGyms()
            .success(function (pData) {
                pData.map(function (pEntry) {
                    pEntry.show = true;
                    return pEntry;
                });

                $scope.gyms = pData;
            });

        $scope.applySearch = function () {
            var search = $scope.form.search;
            search = search.toUpperCase();

            $scope.gyms.map(function (pEntry) {
                if ($scope.form.search === '' ||
                        pEntry.name.toUpperCase().indexOf(search) !== -1 ||
                        pEntry.address.toUpperCase().indexOf(search) !== -1) {
                    pEntry.show = true;
                } else {
                    pEntry.show = false;
                }
                return pEntry;
            });
        };
    }]);
