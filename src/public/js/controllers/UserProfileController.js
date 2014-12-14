/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('UserProfileController', [
        '$scope',
        '$routeParams',
        'LoginService',
        'UsersService',
        function ($scope, $routeParams, LoginService, UsersService) {
            'use strict';

            $scope.userId = $routeParams.userId;

            Chart.defaults.global.colours[0].fillColor = "rgba(255,153,0,1)";

            $scope.options = {
                scaleFontColor: "#000",
                scaleFontSize: 20
            }

            UsersService.getUser($scope.userId)
                .success(function (pData) {
                    $scope.user = pData;
                });

            UsersService.getBoulderSends($scope.userId)
                .success(function (pData) {
                    var dataObject = {},
                        i,
                        send,
                        name,
                        key,
                        entry,
                        labels = [],
                        dataArray = [];

                    $scope.boulderSendsBarGraph = {};

                    for (i = 0; i < pData.length; i += 1) {
                        send = pData[i];
                        name = send.name;
                        if (!dataObject[name]) {
                            dataObject[name] = 0;
                        }
                        dataObject[name] += 1;
                    }

                    var preData = [];
                    for (key in dataObject) {
                        entry = dataObject[key];
                        preData.push({
                            label: key,
                            data: entry
                        })
                    }

                    preData.sort(function(a, b) {
                        return a.label.localeCompare(b.label);
                    });

                    for (i = 0; i < preData.length; i++) {
                        labels.push(preData[i].label);
                        dataArray.push(preData[i].data);
                    };
                    $scope.boulderSendsBarGraph.labels = labels;
                    $scope.boulderSendsBarGraph.data = [dataArray];
                });

            UsersService.getRopeSends($scope.userId)
                .success(function (pData) {
                    var dataObject = {},
                        i,
                        send,
                        name,
                        key,
                        entry,
                        labels = [],
                        dataArray = [];

                    $scope.ropeSendsBarGraph = {};

                    for (i = 0; i < pData.length; i += 1) {
                        send = pData[i];
                        name = send.name;
                        if (!dataObject[name]) {
                            dataObject[name] = 0;
                        }
                        dataObject[name] += 1;
                    }

                    var preData = [];
                    for (key in dataObject) {
                        entry = dataObject[key];
                        preData.push({
                            label: key,
                            data: entry
                        })
                    }

                    preData.sort(function(a, b) {
                        return a.label.localeCompare(b.label);
                    });

                    for (i = 0; i < preData.length; i++) {
                        labels.push(preData[i].label);
                        dataArray.push(preData[i].data);
                    };
                    $scope.ropeSendsBarGraph.labels = labels;
                    $scope.ropeSendsBarGraph.data = [dataArray];
                });

        }]);
